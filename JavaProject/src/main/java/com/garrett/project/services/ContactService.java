package com.garrett.project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.garrett.project.models.Contact;
import com.garrett.project.repositories.ContactRepository;

@Service
public class ContactService {

	@Autowired
	private ContactRepository conRepo;

	public Contact sendContact(Contact newContact, BindingResult result) {
		Optional<Contact> potentialContact = conRepo.findByEmail(newContact.getEmail());
		if (potentialContact.isPresent()) {
			result.rejectValue("email", "contactError",
					"Please wait for our team to respond before sending another request.");
		}
		if (result.hasErrors()) {
			return null;

		} else {
			return conRepo.save(newContact);
		}
	}

	public Contact findOne(Long id) {
		Optional<Contact> potentialContact = conRepo.findById(id);
		if (potentialContact.isPresent()) {
			return potentialContact.get();
		} else {
			return null;
		}
	}

	public List<Contact> allContacts() {
		return conRepo.findAll();
	}

	public String delete(Long id) {
		conRepo.deleteById(id);
		return "redirect:/adminpage";
	}
}
