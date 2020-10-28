package com.codingdojo.jobtracker.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.jobtracker.models.Jobapp;
import com.codingdojo.jobtracker.models.User;

@Repository
public interface JobappRepository extends CrudRepository<Jobapp, Long> {

	@Query(value="SELECT * FROM jobapps ORDER BY appdate DESC;", nativeQuery=true)
	List<Jobapp> findAll();
	
	List<Jobapp> findByUser(User user);
	
	/*
	 * @Query(value="SELECT j FROM jobapps j where j.user =?1 and j.status = ?2;",
	 * nativeQuery=true)
	 */
	List<Jobapp> findByUserAndStatus(User user, String status);
	
	
}
