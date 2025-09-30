package com.cemaco.zebra.controller;

import com.cemaco.zebra.dto.JwtResponseDTO;
import com.cemaco.zebra.dto.UserLoginDTO;
import com.cemaco.zebra.model.User;
import com.cemaco.zebra.security.JwtUtil;
import com.cemaco.zebra.service.AuthService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;



@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired private AuthService authService;
    @Autowired private JwtUtil jwtUtil;
    @Autowired private AuthenticationManager authenticationManager;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody UserLoginDTO login) {
        try {
            authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(login.getUsername(), login.getPassword())
            );
        } catch (BadCredentialsException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid credentials");
        }

        Optional<User> uOpt = authService.authenticate(login.getUsername(), login.getPassword());
        if(uOpt.isEmpty()) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid credentials");

        User u = uOpt.get();
        String token = jwtUtil.generateToken(u.getUsername(), u.getRole(), u.getCodWarehouse());
        JwtResponseDTO resp = new JwtResponseDTO(token, u.getRole(), u.getCodWarehouse());
        return ResponseEntity.ok(resp);
    }

/*    // Redirect from /api/login to /api/auth/login
    @PostMapping("/login")
    public ResponseEntity<?> loginRedirect(@RequestBody UserLoginDTO login) {
        return login(login); // reuses the same logic
    }
*/
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody User user) {
        return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).body("Use DB to add users or implement registration");
    }
}

