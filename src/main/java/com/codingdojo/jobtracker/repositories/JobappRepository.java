package com.codingdojo.jobtracker.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.jobtracker.models.Jobapp;

@Repository
public interface JobappRepository extends CrudRepository<Jobapp, Long> {
	@Query(value="SELECT * FROM shows ORDER BY appdate DESC;", nativeQuery=true)
	List<Jobapp> findAll();

}
