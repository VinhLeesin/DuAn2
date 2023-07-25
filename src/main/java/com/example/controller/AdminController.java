package com.example.controller;

import com.example.model.Account;
import com.example.model.Category;
import com.example.model.Order;
import com.example.model.Product;
import com.example.repo.AccountRepo;
import com.example.repo.CategoryRepo;
import com.example.repo.OrderRepo;
import com.example.repo.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
public class AdminController {
    @Autowired
    CategoryRepo categoryRepo;
    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private AccountRepo accountRepo;

    @Autowired
    OrderRepo orderRepo;

    //  Category
    @GetMapping("/admin/category/index")
    public String listCategory(Model model) {
        List<Category> items = categoryRepo.findAll();
        model.addAttribute("items", items);
        return "admin/category/list";
    }

    @GetMapping("/admin/category/update/{id}")
    public String editCategory(@PathVariable int id, Model model) {
        Category item = categoryRepo.findById(String.valueOf(id)).get();
        model.addAttribute("item", item);
        List<Category> items = categoryRepo.findAll();
        model.addAttribute("items", items);

        return "admin/category/update";
    }

    @RequestMapping("/admin/category/create")
    public String createOrUpdateCategory(Category item) {
        categoryRepo.save(item);
        return "redirect:/admin/category/index";
    }

    @GetMapping("/admin/category/viewAdd")
    public String viewAddCategory() {
        return "admin/category/add";
    }

    @RequestMapping("/admin/category/delete/{id}")
    public String deleteProduct(@PathVariable("id") String id) {
        categoryRepo.deleteById(id);
        return "redirect:/admin/category/index";
    }

    //  Product
    @GetMapping("/admin/product/index")
    public String listProduct(Model model) {
        List<Product> items = productRepo.findAll();
        model.addAttribute("items", items);
        return "admin/product/list";
    }

    @GetMapping("/admin/product/update/{id}")
    public String editProduct(@PathVariable int id, Model model) {
        List<Category> categories = categoryRepo.findAll();
        model.addAttribute("category", categories);
        Product item = productRepo.findById(id).get();
        model.addAttribute("item", item);
        return "admin/product/update";
    }

    @GetMapping("/admin/product/viewAdd")
    public String viewAddProduct(Model model) {
        List<Category> categories = categoryRepo.findAll();
        model.addAttribute("category", categories);
        return "admin/product/add";
    }

    @PostMapping("/admin/product/create")
    public String createOrUpdateProduct(Product product) {
        productRepo.save(product);
        return "redirect:/admin/product/index";
    }

    @RequestMapping("/admin/product/delete/{id}")
    public String deleteProduct(@PathVariable("id") int id) {
        productRepo.deleteById(id);
        return "redirect:/admin/product/index";
    }

    //  Account
    @GetMapping("/admin/account/index")
    public String listAccount(Model model) {
        List<Account> accounts = accountRepo.findAll();
        model.addAttribute("items", accounts);
        return "admin/account/list";
    }

    @PostMapping("/admin/account/create")
    public String createAccount(Account account) {
        accountRepo.save(account);
        return "redirect:/admin/account/index";
    }

    @GetMapping("/admin/account/update/{id}")
    public String editAccount(@PathVariable("id") String username, Model model) {
        Optional<Account> account = accountRepo.findById(username);
        model.addAttribute("item", account.get());
        return "admin/account/update";
    }

    @RequestMapping("/admin/account/viewAdd")
    public String viewAddAccount() {
        return "admin/account/add";
    }

    @RequestMapping("/admin/account/delete/{id}")
    public String deleteAccount(@PathVariable("id") String username) {
        accountRepo.deleteById(username);
        return "redirect:/admin/account/index";
    }

    @RequestMapping("/admin/order/index")
    public String listOrder(@RequestParam(defaultValue = "") String user,
                            @RequestParam(defaultValue = "01/01/1970") String fromDate,
                            @RequestParam(defaultValue = "31/12/2999") String toDate,
                            Model model) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date d1 = sdf.parse(fromDate + " 00:00:00");
        Date d2 = sdf.parse(toDate + " 23:59:59");
        List<Order> items = orderRepo.search("%" + user + "%", d1, d2);
        model.addAttribute("items", items);
        return "admin/order/index";
    }
}
