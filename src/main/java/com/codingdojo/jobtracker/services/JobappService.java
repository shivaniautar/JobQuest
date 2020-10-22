package com.codingdojo.jobtracker.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.config.Task;
import org.springframework.stereotype.Service;

import com.codingdojo.jobtracker.models.Jobapp;
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
	
	
	
//	public Show create(Show show) {
//		return showRepository.save(show);
//	}
//	
//	public Show update(Show show) {
//		return showRepository.save(show);
//	}
//	
//	public List<Show> findAll() {
//		return showRepository.findAll();
//	}
//	
//	public Show findOneById(Long id) {
//		Optional<Show> optionalShow = showRepository.findById(id);
//		
//		if(optionalShow.isPresent()) {
//			return optionalShow.get();
//		} else {
//			return null;
//		}
//	}
//	
//	public void delete(Long id) {
//		Optional<Show> optionalShow = showRepository.findById(id);
//		if(optionalShow.isPresent()) {
//			// CascadeType.REMOVE in Show.java will also delete the reviews associated with that show.
//			showRepository.deleteById(id);
//		} else {
//			System.out.println("Show does not exist");
//		}
//	}

}
