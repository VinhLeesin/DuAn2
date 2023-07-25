package com.example.controller;

import com.example.model.Account;
import com.example.model.Order;
import com.example.model.OrderDetail;
import com.example.model.Product;
import com.example.repo.AccountRepo;
import com.example.repo.OrderDetailRepo;
import com.example.repo.OrderRepo;
import com.example.repo.ProductRepo;
import com.example.service.CartService;
import com.example.service.CategoryService;
import com.example.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
public class UserController {
    @Autowired
    HttpSession session;

    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductService productService;

    @Autowired
    ProductRepo productRepo;

    @Autowired
    AccountRepo accountRepo;

    @Autowired
    OrderRepo orderRepo;

    @Autowired
    OrderDetailRepo orderDetailRepo;

    @Autowired
    CartService cart;

    @ModelAttribute("cart")
    CartService getCart() {
        return cart;
    }

    @Data
    @AllArgsConstructor
    public static class PriceRange {
        int id;
        int minValue;
        int maxValue;
        String display;
    }

    List<PriceRange> priceRangeList = Arrays.asList(
            new PriceRange(0, 0, Integer.MAX_VALUE, "Tất cả"),
            new PriceRange(1, 0, 10000000, "Dưới 10 triệu"),
            new PriceRange(2, 10000000, 20000000, "Từ 10-20 triệu"),
            new PriceRange(3, 20000000, Integer.MAX_VALUE, "Trên 20 triệu")
    );

    @RequestMapping("/")
    public String index(
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(defaultValue = "") String categoryId,
            @RequestParam(defaultValue = "0") int priceRangeId,
            @RequestParam(defaultValue = "0") int page,
            Model model) {

        if (session.getAttribute("username") == null) {
            return "redirect:/login";
        }
        model.addAttribute("priceRangeList", priceRangeList);
        model.addAttribute("categoryList", categoryService.getAll());
//		model.addAttribute("productList", productService.getAll());

        int minPrice = priceRangeList.get(priceRangeId).minValue;
        int maxPrice = priceRangeList.get(priceRangeId).maxValue;

        System.out.println("keyword=" + keyword);
        System.out.println("categoryId=" + categoryId);
        System.out.println("minPrice=" + minPrice);
        System.out.println("maxPrice=" + maxPrice);
        System.out.println("page=" + page);

        Pageable pageable = PageRequest.of(page, 5);
        if (categoryId.isEmpty()) {
            Page<Product> data = productRepo.searchByNamePrice("%" + keyword, minPrice, maxPrice, pageable);
            model.addAttribute("page",data);
        }else {
            Page<Product> data = productRepo.searchByCategoryNamePrice(categoryId,"%" + keyword, minPrice, maxPrice, pageable );
            model.addAttribute("page",data);
        }

        return "home/index";
    }

    @GetMapping("/detail/{id}")
    public String viewProduct(@PathVariable int id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "home/detail";
    }

    @RequestMapping("/add-to-cart/{id}")
    public String addToCart(@PathVariable int id) {
        cart.add(id);
        return "redirect:/cart";
    }

    @RequestMapping("/remove-cart/{id}")
    public String removeCart(@PathVariable int id) {
        cart.remove(id);
        if (cart.getTotal() == 0) {
            return "redirect:/";
        }
        return "redirect:/cart";
    }

    @RequestMapping("/update-cart/{id}")
    public String updateCart(@PathVariable int id, int quantity) {
        cart.update(id, quantity);
        return "redirect:/cart";
    }

    @GetMapping("/cart")
    public String cart() {
        return "home/cart";
    }

    @GetMapping("/confirm")
    public String confirm() {
        return "home/confirm";
    }

    @RequestMapping("/about")
    public String about(Model model) {
        return "home/about";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model) {
        Account acc = accountRepo.findByUsernameAndPassword(
                username, password).orElse(null);
        // TODO: Check DB
        if (acc != null) {
            session.setAttribute("username", username);
            return "redirect:/";
        } else {
            model.addAttribute("message", "Tên đăng nhập/mật khẩu không đúng");
            return "login";
        }
    }

    @PostMapping("/purchase")
    public String purchase(@RequestParam String address) {
        System.out.println("address=" + address);
        System.out.println("items=" + cart.getItems());

        String un = (String) session.getAttribute("username");
        Account acc = accountRepo.findById(un).orElse(null);
        if (acc != null) {
            Order order = new Order();
            ;
            order.setAddress(address);
            order.setAccount(acc);
            orderRepo.save(order);
            for (OrderDetail item : cart.getItems()) {
                item.setOrder(order);
                orderDetailRepo.save(item);
            }
        }
        cart.clear();
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout() {
        session.removeAttribute("username");
        return "redirect:/login";
    }

    @RequestMapping("/product/search-and-page")
    public String searchAndPage(Model model,
                                @RequestParam("keyword") Optional<String> kw,
                                @RequestParam("p") Optional<Integer> p) {
        String kwords = kw.orElse((String) session.getAttribute("keyword"));
        session.setAttribute("keywords", kwords);
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Product> page = productRepo.findAllByNameLike("%" + kwords + "%", pageable);
        if (page.getContent().size() == 0) {
            return "redirect:/product/search-and-page";
        }
        model.addAttribute("page", page);
        return "product/search-page";
    }

}
