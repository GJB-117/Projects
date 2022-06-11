package com.garrett.project.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.garrett.project.models.Contact;

@Repository
public interface ContactRepository extends CrudRepository<Contact, Long> {
	
	Optional<Contact> findByEmail(String email);
	
	List<Contact> findAll();
	
}
