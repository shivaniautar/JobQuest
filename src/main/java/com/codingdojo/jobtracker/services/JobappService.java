package com.codingdojo.jobtracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.jobtracker.models.Jobapp;
import com.codingdojo.jobtracker.models.User;
import com.codingdojo.jobtracker.repositories.JobappRepository;


@Service
public class JobappService {
	
	@Autowired
	private JobappRepository jobappRepository;
	
	// find by id 
	
	public Jobapp findById(Long id) {
		Optional<Jobapp> myJob = jobappRepository.findById(id);
		if (myJob.isPresent()) {
			return myJob.get();
		} else {
			return null;
		}
		
	}
	
	
	
	//create a jobapp
	
	public Jobapp createJobapp(Jobapp myJobapp) {
		return jobappRepository.save(myJobapp);
	}
	
	
	//update a jobapp
	
	public void updateJobapp(Jobapp myJobapp) {
		jobappRepository.save(myJobapp);
	}
	
	
	//find by id
	public Jobapp findJobapp(Long id) {
		Optional<Jobapp> optionalJobapp = jobappRepository.findById(id);
		if(optionalJobapp.isPresent()) {
			return optionalJobapp.get();
		} else {
			return null;
		}
		
	}
	
	
	//delete jobapp
	
	public void deleteJobapp(Long id) {
		jobappRepository.deleteById(id);
	}
	
	
	public List<Jobapp> findAll(){
		return jobappRepository.findAll();
	}
	
	public List<Jobapp> allByUser(User user) {
		return jobappRepository.findByUser(user);
	}



}
