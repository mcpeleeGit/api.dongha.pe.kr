package com.googsu.api.repository.user;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.googsu.api.domain.user.User;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByEmail(String email);
}