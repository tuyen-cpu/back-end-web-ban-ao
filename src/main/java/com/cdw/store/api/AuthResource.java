package com.cdw.store.api;

import com.cdw.store.dto.*;
import com.cdw.store.model.Role;
import com.cdw.store.model.User;
import com.cdw.store.security.jwt.JwtUtils;
import com.cdw.store.security.sevice.UserDetailsImpl;
import com.cdw.store.service.IVoucherService;
import com.cdw.store.service.impl.RoleService;
import com.cdw.store.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/auth")
@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600, allowCredentials = "true")
public class AuthResource {
    @Autowired
    AuthenticationManager authenticationManager;
    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;
    @Autowired
    PasswordEncoder encoder;
    @Autowired
    JwtUtils jwtUtils;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private IVoucherService voucherService;

    @PostMapping("/signin")
    public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginDto loginDto, BindingResult bindingResult) {
        /*
         * If the authentication process is successful,
         * we can get User???s information such as username, password, authorities from an Authentication object.
         * Authentication works with UserDetails
         */
        Authentication authentication = authenticationManager
                .authenticate(new UsernamePasswordAuthenticationToken(loginDto.getUsername(), loginDto.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

        //Add jwt to cookies
        ResponseCookie jwtCookie = jwtUtils.generateJwtCookie(userDetails);
        List<String> roles = userDetails.getAuthorities().stream().map(item -> item.getAuthority())
                .collect(Collectors.toList());
        return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, jwtCookie.toString())
                .body(new UserInfoDto(userDetails.getId(), userDetails.getUsername(), userDetails.getEmail(), roles));
    }

    @PostMapping("/signup")
    public ResponseEntity<?> registerUser(@Valid @RequestBody SignupDto signupDto) {
        if (userService.existsByUsername(signupDto.getUsername())) {
            return ResponseEntity.badRequest().body(new MessageDto("Error: Username is already taken!"));
        }
        if (userService.existsByEmail(signupDto.getEmail())) {
            return ResponseEntity.badRequest().body(new MessageDto("Error: Email is already taken!"));
        }
        User user = new User();
        user.setUsername(signupDto.getUsername());
        user.setPassword(encoder.encode(signupDto.getPassword()));
        user.setEmail(signupDto.getEmail());

        Role role = roleService.findByName("client");
        user.getRoles().add(role);
        userService.addUser(user);

        Calendar cal = Calendar.getInstance();
        VoucherDto voucher = new VoucherDto();
        voucher.setTime(1);
        voucher.setCode("chaobanmoi50");
        voucher.setStartedDate(cal.getTime());
        cal.add(Calendar.DATE, 30);
        voucher.setEndedDate(cal.getTime());
        voucher.setStatus(1);
        voucher.setCost(50000L);
        this.voucherService.saveVoucher(voucher);

        this.sendEmail(user.getEmail(), voucher.getCode());

        return ResponseEntity.ok(new MessageDto("User registered successfully!"));
    }

    @PostMapping("/signout")
    public ResponseEntity<?> logoutUser() {
        ResponseCookie cookie = jwtUtils.getCleanJwtCookie();
        return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, cookie.toString()).body(new MessageDto("You've been signed out!"));
    }

    private boolean sendEmail(String email, String voucherCode) {
        MimeMessage msg = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(msg);

        try {
            helper.setFrom("ContactHatranShop@gmail.com", "Shop My_Memory");
            helper.setTo(email);

            String subject = "E-voucher";
            String content = "<p>Xin ch??o, </p>" + "<p>My_Memory xin t???ng b???n voucher: <b> <h2>" + voucherCode + "</h2></b></p>"
                    + "<p>- Voucher c?? gi?? tr??? 50.000??.</p>"
                    + "<p>- Voucher c?? th???i h???n trong v??ng 30 ng??y k??? t??? khi ???????c g???i.</p>"
                    + "<p>- M???i th???c m???c v??? voucher c?? th??? g????? mail v??? ContactHatranShop@gmail.com ????? nh???n ???????c ph???n h???i s???m nh???t!!!</p>";
            helper.setSubject(subject);
            helper.setText(content, true);
            mailSender.send(msg);
            return true;

        } catch (UnsupportedEncodingException | MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }
}
