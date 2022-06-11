package com.garrett.project.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.garrett.project.models.PC;
import com.garrett.project.models.User;
import com.garrett.project.services.PcService;
import com.garrett.project.services.UserService;

@Controller
public class PcController {
	
	
	@Autowired
	private PcService pcServ;
	
	@Autowired
	private UserService userServ;
	
	@GetMapping("/show")
	public String show(Model model, HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		
		if(userId == null) {
			return "redirect:/signin";
		} else {
			User thisUser = userServ.findOne(userId);
			model.addAttribute("thisUser", thisUser);
			List<PC> allPcs = pcServ.allPcs();
			model.addAttribute("pcs", allPcs);
			return "ShowAll.jsp";
		}
	}
	
	@ModelAttribute("resolutions")
	public List<String> createResolutions(){
		List<String> resolutions = new ArrayList<String>();
		resolutions.add("FHD: 1920 x 1080p @ 144hz");
		resolutions.add("2K: 2560 x 1440p @ 144hz");
		resolutions.add("4K: 3840 x 2160p @ 60hz");
		resolutions.add("6K: 5120 x 2160p @ 30hz");
		
		return resolutions;
	}
	
	@GetMapping("/new/pc")
	public String newPc(@ModelAttribute("newPc") PC newPc,
			BindingResult result, Model model, HttpSession session
			) {
		Long userId = (Long)session.getAttribute("user_id");
		
		if(userId == null) {
			return "redirect:/signin";
		} else {
			User thisUser = userServ.findOne(userId);
			model.addAttribute("thisUser", thisUser);
			List<PC> pcs = pcServ.allPcs();
			model.addAttribute("pcs", pcs);
		
		return "CreatePC.jsp";
		}
	}
	
	@PostMapping("/create/pc")
	public String create(@Valid @ModelAttribute("newPc") PC newPc,
			BindingResult result, Model model
			) {
		if(result.hasErrors()) {
			List<PC> pcs = pcServ.allPcs();
			model.addAttribute("pcs", pcs);
			return "CreatePC.jsp";
		} else {
			pcServ.createPc(newPc);
			return "redirect:/show";
		}
	}
	
	@GetMapping("/edit/{id}")
	public String editPc(@PathVariable("id") Long id, Model model) {
		PC pc = pcServ.findPc(id);
		model.addAttribute("pc", pc);
		return "EditPC.jsp";
	}
	
	@GetMapping("/show/{id}")
	public String showPc(@PathVariable("id")Long id, Model model) {
		PC pc = pcServ.findPc(id);
		model.addAttribute("pc", pc);
		return "ShowPc.jsp";
	}
	
	@RequestMapping(value="/edit/pc/{id}", method = RequestMethod.PUT)
	public String updatePc(@Valid @ModelAttribute("pc") PC pc,
			BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "EditPC.jsp";
		} else {
			pcServ.updatePc(pc);
			return "redirect:/show";
		}
	}
	
	@DeleteMapping("/remove/pc/{id}")
	public String removePc(@PathVariable("id") Long id) {
		pcServ.delete(id);
		return "redirect:/show";
	}
	
	@GetMapping("/help")
	public String help() {
		return "Help.jsp";
	}
	
	
	
	
}
