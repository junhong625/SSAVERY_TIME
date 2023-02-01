package com.ssafy.ssafytime.db.repository;

//import com.ssafy.ssafytime.db.entity.Attendance;
import com.ssafy.ssafytime.db.entity.User;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;


public interface UserRepository extends JpaRepository<User, Long>{
    @EntityGraph(attributePaths = {"authorities"})
    Optional<User> findOneWithAuthoritiesByUserEmail(String userEmail);



}
