package com.armando.SoloProject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.armando.SoloProject.models.Flights;
import com.armando.SoloProject.models.User;
import com.armando.SoloProject.services.FlightService;
import com.armando.SoloProject.services.UserService;

@Controller
public class FlightController {

		@Autowired
		private UserService users;
		@Autowired
		private FlightService flights;
		
		//adding a flight
		@GetMapping("/addFlight")
		public String addFlight(@ModelAttribute("flight") Flights flight, Model model, HttpSession session) {

			User user = users.findById((Long) session.getAttribute("userId"));
			model.addAttribute("user", user);

			return "addSoloFlight.jsp";
		}
		
		@PostMapping("/flights")
		public String addOneFlight(@Valid @ModelAttribute("flight") Flights flight, BindingResult result) {
			if(result.hasErrors()) {
				return "addSoloFlight.jsp";
			}
			flights.create(flight);
			return "redirect:/welcome";
		}
				
		//viewing a flight
	    @GetMapping("/view/{id}")
	    public String viewPage(Model model, @PathVariable("id") Long id, HttpSession session) {
	    	if(session.getAttribute("userId") == null) {
	    		return "redirect:/";
	    	}
	    	Flights flight = flights.findById(id);
	    	model.addAttribute("flights", flight);
	    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
	    	
	    	return "viewFlight.jsp";
	    }
	    
	    //route for editing flights
	    @GetMapping("/flights/{id}/edit")
	    public String edit(Model model, @PathVariable("id") Long id, HttpSession session) {
	    	if(session.getAttribute("userId") == null) {
	    		return "redirect:/";
	    	}
	    	Flights flight = flights.findById(id);
	    	model.addAttribute("flights", flight);
	    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
	    	return "editFlight.jsp";
	    }
	    
	    @PutMapping("/flights/{id}/edit")
	    public String editFlight(Model model, @Valid @ModelAttribute("flights")Flights flight, BindingResult result, HttpSession session) {
	    	if(session.getAttribute("userId") == null) {
	    		return "redirect:/welcome";
	    	}
	    	if(result.hasErrors()) {
	    		return "editFlight.jsp";
	    	}
	    	flights.updateFlight(flight);
	    	return "redirect:/welcome";
	    }
	    
	    //for deleting a flight
	    @GetMapping("/flights/{id}/delete")
	    public String delete(@PathVariable("id") Long id, HttpSession session) {
	    	Flights flight = flights.findById(id);
	    	flights.deleteFlight(flight);
	    	return "redirect:/welcome";
	    }

	    @GetMapping("/flights/{id}/saveFlight")
	    public String saveIt(@PathVariable("id") Long id, HttpSession session) {
	    	if(session.getAttribute("userId") == null) {
	    		return "redirect:/welcome";
	    	}
	    	Flights flight = flights.findById(id);
	    	flight.setSave_flight(users.findById((Long)session.getAttribute("userId")));
	    	flights.updateFlight(flight);
	    	return "redirect:/welcome";
	    }
	    
	    @GetMapping("/flights/{id}/rebook")
	    public String rebookFlight(@PathVariable("id") Long id, HttpSession session) {
	    	if(session.getAttribute("userId") == null) {
	    		return "redirect:/";
	    	}
	    	Flights flight = flights.findById(id);
	    	flight.setSave_flight(null);
	    	flights.updateFlight(flight);
	    	return "redirect:/welcome";
	    }
}
