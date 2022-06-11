package com.garrett.project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.garrett.project.models.PC;
import com.garrett.project.repositories.PcRepository;

@Service
public class PcService {
	
	@Autowired
	private PcRepository pcRepo;
	
	public List<PC> allPcs(){
		return pcRepo.findAll();
	}
	
	public PC createPc(PC p) {
		return pcRepo.save(p);
	}
	
	public PC findPc(Long id) {
		Optional<PC> optionalPc = pcRepo.findById(id);
		if(optionalPc.isPresent()) {
			return optionalPc.get();
		}else {
			return null;
		}
	}
	
	public PC updatePc(PC p) {
		return pcRepo.save(p);
	}
	
	public String delete(Long id) {
		pcRepo.deleteById(id);
		return "redirect:/home";
	}
}
