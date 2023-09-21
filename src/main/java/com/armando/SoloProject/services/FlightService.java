package com.armando.SoloProject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.armando.SoloProject.models.Flights;
import com.armando.SoloProject.repositories.FlightRepo;

@Service
public class FlightService {
	@Autowired
	private FlightRepo flightRepo;
	
	public Flights findById(Long id) {
		Optional<Flights> result = flightRepo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<Flights> all() {
		return flightRepo.findAll();
	}
	
	public Flights create(Flights flights) {
		return flightRepo.save(flights);
	}
	
	public Flights updateFlight(Flights flights) {
		return flightRepo.save(flights);
	}
	
	public void deleteFlight(Flights flights) {
		flightRepo.delete(flights);
	}
}
