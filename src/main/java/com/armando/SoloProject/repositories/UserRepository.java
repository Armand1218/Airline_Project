package com.armando.SoloProject.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.armando.SoloProject.models.User;

public interface UserRepository extends CrudRepository<User, Long> {
	Optional<User> findByEmail(String email);
}
