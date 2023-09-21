package com.armando.SoloProject.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.armando.SoloProject.models.LoginUser;
import com.armando.SoloProject.models.User;
import com.armando.SoloProject.repositories.UserRepository;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepo;
    
    public User register(User newUser, BindingResult result) {
    	
    	Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
    	if(potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "An Account with that email already exists!");
    	}
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    	    result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
    	}
    	if(result.hasErrors()) {
    	return null;
    	}
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashed);
    	return userRepo.save(newUser);
    }
    // This method will be called from the controller
    // whenever a user submits a login form.
        public User login(LoginUser newLoginObject, BindingResult result) {
        // TO-DO - Reject values:
        Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
    	if(!potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "Invalid user!");
    		return null;
    	}
    	User user = potentialUser.get();
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	}

    	if(result.hasErrors()) {
    	return null;
    	}
    	return user;
        }
        
    public User findById(Long id) {
        Optional<User> potentialUser = userRepo.findById(id);
        if(potentialUser.isPresent()) {
        	return potentialUser.get();
        }
        return null;
        }
}
