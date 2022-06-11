package com.garrett.project.services;


import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.garrett.project.models.LoginUser;

import com.garrett.project.models.User;

import com.garrett.project.repositories.UserRepository;

@Service
public class UserService {
	
	
	@Autowired
	private UserRepository userRepo;
	
	
	public User register(User newUser, BindingResult result) {
		// Reject if email is taken
		Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
		if (potentialUser.isPresent()) {
			result.rejectValue("email", "registerErrors", "This email is taken");
		}
		// Reject if passwords don't match with confirm
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "registerErrors", "The confirm must match the password");
		}

		// Return Null if result has Errors
		if (result.hasErrors()) {
			return null;
		} else {
			// HASH and set Password, save user to database
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			// SAVE User to the database
			return userRepo.save(newUser);
		}

	}
	
	public User login(LoginUser newLoginObject, BindingResult result) {
		// FIND USER IN DB
		Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
		if (!potentialUser.isPresent()) {
			result.rejectValue("email", "loginError", "Email not found");
		} else {

			User user = potentialUser.get();
			// REJECT IF BCRYPT PASS MATCH FAILS
			if (!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
				// Reject
				result.rejectValue("password", "loginError", "Invalid Password");
			}
			if (result.hasErrors()) {
				return null;
			} else {
				return user;
			}
		}
		return null;
	}
	
	//Find one user
		public User findOne(Long id) {
			Optional<User> potentialUser = userRepo.findById(id);
			if(potentialUser.isPresent()) {
				return potentialUser.get();
			} else {
				return null;
			}
		}
}
