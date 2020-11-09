package com.example.liquibasejpa.domain.model;

import org.springframework.http.ResponseEntity;

public interface AbstractUserOperations {
    public ResponseEntity listUsers();
    public ResponseEntity addUser(User user);
}
