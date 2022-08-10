package com.yeshua.book.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.yeshua.book.models.LoginUser;
import com.yeshua.book.models.User;
import com.yeshua.book.repositories.UserRepository;

@Service
public class UserServices {
	
	@Autowired
	UserRepository userRepository;
	
	public User register(User newUser, BindingResult result) {
		Optional<User> takenUser = userRepository.findByEmail(newUser.getEmail());
		if (takenUser.isPresent())
			return null;
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
			return null;
		}
		if (result.hasErrors())
			return null;
		String hashedString = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashedString);
		return userRepository.save(newUser);
	}
	
	public User login(LoginUser newLoginObject, BindingResult result) {
		Optional<User> currentUser = userRepository.findByEmail(newLoginObject.getEmail());
		User user;
		if (!currentUser.isPresent()) {
			return null;
		}
		else {
			user =  currentUser.get();
		}
		if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
		    result.rejectValue("password", "Matches", "Invalid Password!");
		}
		return user;
	}
	
	public User createUser(User user) {
		return userRepository.save(user);
	}
	
	public List<User> allUsers() {
		return userRepository.findAll();
	}
	
	public User findUser(Long id) {
		Optional<User> optionalUser = userRepository.findById(id);
		if (optionalUser.isPresent()) {
			return optionalUser.get();
		}
		return null;
	}
}
