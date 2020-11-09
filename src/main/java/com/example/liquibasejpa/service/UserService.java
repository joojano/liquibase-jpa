package com.example.liquibasejpa.service;

import com.example.liquibasejpa.domain.model.AbstractUserOperations;
import com.example.liquibasejpa.domain.model.User;
import com.example.liquibasejpa.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;


@Service
public class UserService implements AbstractUserOperations {
    @Autowired
    private UserRepository userRepository;

    @Override
    public ResponseEntity listUsers() {
        return ResponseEntity.ok(userRepository.findAll());
    }

    @Override
    public ResponseEntity addUser(User user) {
        return ResponseEntity.ok(userRepository.save(user));
    }
}
