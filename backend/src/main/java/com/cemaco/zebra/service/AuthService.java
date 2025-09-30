package com.cemaco.zebra.service;

import com.cemaco.zebra.model.User;
import com.cemaco.zebra.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.Optional;

@Service
public class AuthService {

    @Autowired private UserRepository userRepository;
    @Autowired private PasswordEncoder passwordEncoder;

    public Optional<User> authenticate(String username, String rawPassword) {
        Optional<User> uOpt = userRepository.findByUsername(username);
        if(uOpt.isPresent()){
            User u = uOpt.get();
            if(passwordEncoder.matches(rawPassword, u.getPassword())){
                return Optional.of(u);
            }
        }
        return Optional.empty();
    }

    // registration helper (not exposed publicly by default)
    public User register(String username, String rawPassword, String role, String codWarehouse){
        User u = new User();
        u.setUsername(username);
        u.setPassword(passwordEncoder.encode(rawPassword));
        u.setRole(role);
        u.setCodWarehouse(codWarehouse);
        return userRepository.save(u);
    }
}

