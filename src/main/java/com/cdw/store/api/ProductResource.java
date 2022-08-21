package com.cdw.store.api;

import java.util.*;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import com.cdw.store.dto.ProductAddDto;
import com.cdw.store.model.Filter;
import com.cdw.store.model.QueryOperator;
import com.cdw.store.repo.ProductRepo;
import com.cdw.store.repo.specs.ProductSpecification;
import com.cdw.store.utils.ProductConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import com.cdw.store.dto.DetailProductDto;
import com.cdw.store.dto.ProductDto;
import com.cdw.store.model.Product;
import com.cdw.store.service.impl.ProductService;

@RestController
@RequestMapping("/product")
public class ProductResource {
	@Autowired
	private ProductService productService;
@Autowired
private ProductRepo productRepo;
@Autowired
ProductConverter productConverter;
//	@GetMapping("/all")
//	public ResponseEntity<List<ProductDto>> getAllProducts(){
//		List<ProductDto> products = productService.findALlProducts();
//		return new ResponseEntity<List<ProductDto>>(products, HttpStatus.OK);
//	}
	@GetMapping("/instantSearch/query")
	public ResponseEntity<List<ProductDto>> searchProducts(@RequestParam("key")String key){
		List<ProductDto> products = productService.searchProducts(key);
		return new ResponseEntity<List<ProductDto>>(products, HttpStatus.OK);
	}
	@GetMapping("/things")
	public ResponseEntity getThings(@RequestParam("filter") String[] filters) {
		return ResponseEntity.ok(filters);
	}
	@GetMapping("/all")
	public ResponseEntity<Map<String, Object>> searchProducts(@RequestParam(required = false) String q,
															 @RequestParam(defaultValue = "0") int page,
															 @RequestParam(defaultValue = "10") int size){
		Pageable paging = PageRequest.of(page, size);
		Page<ProductDto> pageProducts;
		if(q.equals("")){
			pageProducts=productService.findAll(paging);
		}else{
				pageProducts=productService.searchAndPaging(q,paging);
		}
		return new ResponseEntity<>(responsePaging(pageProducts), HttpStatus.OK);
	}
	@GetMapping("/test")
	public ResponseEntity<List<ProductDto>> test(){
		return new ResponseEntity<>(productService.test(), HttpStatus.OK);
	}

//	@GetMapping("/all/{id}")
//	public ResponseEntity<Map<String, Object>> getProductsByCategoryId(@PathVariable("id") Long id, @RequestParam(defaultValue = "0") int page,
//																		 @RequestParam(defaultValue = "10") int size){
//		Pageable paging = PageRequest.of(page, size);
//		Page<ProductDto> pageProducts=productService.findByCategoryId(id,paging);
//		return new ResponseEntity<>(responsePaging(pageProducts), HttpStatus.OK);
//	}
	private Map<String, Object> responsePaging(Page<ProductDto> pageProducts){
		List<ProductDto> products= pageProducts.getContent();
		Map<String, Object> response = new HashMap<>();
		response.put("products", products);
		response.put("currentPage", pageProducts.getNumber());
		response.put("totalItems", pageProducts.getTotalElements());
		response.put("totalPages", pageProducts.getTotalPages());
		return response;
	}

	@GetMapping("/{id}")
	public ResponseEntity<DetailProductDto> getProductById(@PathVariable("id") Long id){
		DetailProductDto product = productService.findProductById(id);
		return new ResponseEntity<DetailProductDto>(product, HttpStatus.OK);
	}

	
	@GetMapping("/{id}/price")
	public ResponseEntity<Long> getOutputPriceProductById(@PathVariable("id") Long id){
		Long price = productService.getOutputPriceProductById(id); //include: price-discount
		return new ResponseEntity<Long>(price, HttpStatus.OK);
	}
	
	private String convertWithoutUnderStoke(String str){
		return str.split("_")[0];
	}
	private List<String> splitCommon(List<String> list){
		return	list.stream()
				.flatMap(Pattern.compile(",")::splitAsStream)
				.collect(Collectors.toList());

	}
	@GetMapping("/filter")
	public ResponseEntity<Map<String, Object>> getFilter( @RequestParam()  MultiValueMap<String, String> request){

		int page[]={0,10};
		Page<ProductDto> productDtos ;
		ProductSpecification productSpecifications = new ProductSpecification();
		request.forEach((k, value) -> {
					if(k.endsWith("lte")){
						productSpecifications.add(new Filter(convertWithoutUnderStoke(k),QueryOperator.LESS_THAN_EQUAL ,value.get(0)));
					}
					else if(k.endsWith("gte")){
						productSpecifications.add(new Filter(convertWithoutUnderStoke(k),QueryOperator.GREATER_THAN_EQUAL ,value.get(0)));
					} else if(k.equals("size")){
						page[1]= Integer.parseInt(value.get(0));
					}
					else if(k.equals("page")){
						page[0]= Integer.parseInt(value.get(0));
					}
					else{
						if(k.startsWith("category")){
								productSpecifications.add(new Filter(k,QueryOperator.EQUAL ,value.get(0)));

						}

					}
		});
		System.out.println("[page,size]"+Arrays.toString(page));
		Pageable paging = PageRequest.of(page[0], page[1]);

		Page<Product> products = productRepo.findAll(productSpecifications,paging);

		productDtos =productConverter.convertToDto(products);

		productDtos.forEach(System.out::println);
		return new ResponseEntity<>(responsePaging(productDtos), HttpStatus.OK);
	}

	@PostMapping("/add")
	public ResponseEntity<ProductDto> addProduct(@RequestBody ProductAddDto productAddDto){

		ProductDto newProduct = productService.addProduct(productAddDto);

		return new ResponseEntity<ProductDto>(newProduct, HttpStatus.CREATED);
	}

	@PutMapping("/update")
	public ResponseEntity<ProductDto> updateProduct(@RequestBody ProductAddDto productAddDto){
		 ProductDto product= productService.addProduct(productAddDto);
		return new ResponseEntity<>(product, HttpStatus.OK);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> deleteProduct(@PathVariable("id") Long id){
		productService.deleteProduct(id);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//check quantity product
	@GetMapping("/{id}/quantity")
	public ResponseEntity<Long> getQuantityProduct(@PathVariable("id") Long id){
		Long quantity = productService.getQuantityProductByProductId(id);
		return new ResponseEntity<Long>(quantity, HttpStatus.OK);
	}
	@GetMapping("/{id}/description")
	public ResponseEntity<String> getLongDescription(@PathVariable("id") Long id){
		String desc = productService.getLongDescription(id);
		return new ResponseEntity<String>(desc, HttpStatus.OK);
	}



}
