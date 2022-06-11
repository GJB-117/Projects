package com.garrett.project.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.garrett.project.models.Contact;
import com.garrett.project.models.LoginUser;
import com.garrett.project.models.PC;
import com.garrett.project.models.User;
import com.garrett.project.services.ContactService;
import com.garrett.project.services.PcService;
import com.garrett.project.services.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userServ;

	@Autowired
	private ContactService conServ;

	@Autowired
	private PcService pcServ;

	@GetMapping("/")
	public String index(Model model, HttpSession session) {
		return "Welcome.jsp";
	}

	@GetMapping("/home")
	public String home() {
		return "Welcome.jsp";
	}

	// RENDER LOGIN/ REGISTER PAGE
	@GetMapping("/signin")
	public String index(Model model) {

		// Bind empty User and LoginUser objects to the JSP
		// to capture the form input
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "RegLogin.jsp";
	}

	// REGISTER NEW USER
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {

		userServ.register(newUser, result);

		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "RegLogin.jsp";
		} else {
			session.setAttribute("admin", newUser.getAdmin());
			session.setAttribute("user_id", newUser.getId());
			return "redirect:/home";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession s) {
		s.invalidate();
		return "redirect:/";
	}

	@GetMapping("/contact")
	public String contact(@ModelAttribute("newContact") Contact newContact, BindingResult result, Model model,
			HttpSession session) {
		Long userId = (Long) session.getAttribute("user_id");

		if (userId == null) {
			return "redirect:/errorpage";
		} else {
			User thisUser = userServ.findOne(userId);
			model.addAttribute("thisUser", thisUser);
			List<Contact> contacts = conServ.allContacts();
			model.addAttribute("contacts", contacts);

			return "contact.jsp";
		}

	}

	@GetMapping("/adminpage")
	public String admin(Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user_id");
		Integer admin = (Integer) session.getAttribute("admin");

		if (userId == null) {
			return "redirect:/errorpage";
		}
		if (admin != 1) {
			return "redirect:/errorpage";
		} else {
			User thisUser = userServ.findOne(userId);
			model.addAttribute("thisUser", thisUser);
			List<PC> allPcs = pcServ.allPcs();
			model.addAttribute("pcs", allPcs);
			List<Contact> allContacts = conServ.allContacts();
			model.addAttribute("contacts", allContacts);
			return "adminpage.jsp";
		}
	}

	@GetMapping("/contact/{id}")
	public String viewContact(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user_id");
		Integer admin = (Integer) session.getAttribute("admin");

		if (userId == null) {
			return "redirect:/errorpage";
		}
		if (admin != 1) {
			return "redirect:/errorpage";
		} else {
			User thisUser = userServ.findOne(userId);
			model.addAttribute("thisUser", thisUser);
			Contact contact = conServ.findOne(id);
			model.addAttribute("contact", contact);
			return "ViewMessage.jsp";
		}

	}

	@RequestMapping("/remove/message/{id}")
	public String removeMessage(@PathVariable("id") Long id,
			HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("user_id");
		Integer admin = (Integer) session.getAttribute("admin");
		
	
		if(userId == null) {
			return "redirect:/errorpage";
		}
		if(admin != 1 ) {
			return "redirect:/errorpage";
		} else {
			User thisUser = userServ.findOne(userId);
			model.addAttribute("thisUser", thisUser);
			conServ.delete(id);
			return "redirect:/adminpage";
		}
		
	}

	@GetMapping("/errorpage")
	public String errorpage() {
		return "error.jsp";
	}

	@PostMapping("/send/contact")
	public String create(@Valid @ModelAttribute("newContact") Contact newContact, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Contact> contacts = conServ.allContacts();
			model.addAttribute("contacts", contacts);
			return "contact.jsp";
		} else {
			conServ.sendContact(newContact, result);
			return "redirect:/sent";
		}
	}

	@GetMapping("/sent")
	public String sent() {
		return "sent.jsp";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {

		// Add once service is implemented:
		// User user = userServ.login(newLogin, result);

		User user = userServ.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "RegLogin.jsp";
		} else {
			session.setAttribute("admin", user.getAdmin());
			session.setAttribute("user_id", user.getId());
			return "redirect:/home";
		}

	}

	@GetMapping("/team")
	public String team() {
		return "team.jsp";
	}
}
