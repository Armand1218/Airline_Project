package com.armando.SoloProject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.armando.SoloProject.models.Flights;

public interface FlightRepo extends CrudRepository<Flights, Long>{
	List<Flights> findAll();
}
