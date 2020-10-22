package com.codingdojo.jobtracker.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.jobtracker.models.User;





@Repository
public interface UserRepository extends CrudRepository<User, Long>{
	User findUserById(Long id);
	User findByEmail(String email);

}
