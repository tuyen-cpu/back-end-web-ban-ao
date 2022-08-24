package com.cdw.store.api;

import com.cdw.store.dto.PaypalDto;
import com.cdw.store.service.IPaypalService;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class PaymentResource {
    @Autowired
    IPaypalService service;
    public static final String SUCCESS_URL = "pay/success";
    public static final String CANCEL_URL = "pay/cancel";

    @Value( "http://localhost:" + "${server.port}" + "/")
    public String DOMAIN;


    @PostMapping("/pay")
    public String payment(@RequestBody PaypalDto paypalDto) {
        try {
            Payment payment = service.createPayment(paypalDto.getPrice(), paypalDto.getCurrency(), paypalDto.getMethod(),
                    paypalDto.getIntent(), paypalDto.getDescription(), DOMAIN + CANCEL_URL,
                    DOMAIN + SUCCESS_URL);
            for(Links link : payment.getLinks()) {
                if(link.getRel().equals("approval_url")) {
                    return "redirect:"+link.getHref();
                }
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }

    @GetMapping(value = CANCEL_URL)
    public ResponseEntity<String> cancelPay() {
        return new ResponseEntity<>("failed",HttpStatus.OK);

    }

    @GetMapping(value = SUCCESS_URL)
    public ResponseEntity<String> successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId) {
        try {
            Payment payment = service.executePayment(paymentId, payerId);
            System.out.println(payment.toJSON());
            if (payment.getState().equals("approved")) {
                return new ResponseEntity<String>("success", HttpStatus.OK);
            }
        } catch (PayPalRESTException e) {
            System.out.println(e.getMessage());
        }
        return new ResponseEntity<String>("failed", HttpStatus.OK);
    }
}
