package com.ssafy.ssafytime.db.repository;

//import com.ssafy.ssafytime.db.entity.Attendance;
import com.ssafy.ssafytime.api.dto.AttendanceInterface;
import com.ssafy.ssafytime.db.entity.User;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
    @EntityGraph(attributePaths = {"authorities"})
    Optional<User> findOneWithAuthoritiesByUserEmail(String userEmail);

    List<User> findByClassNumAndRegionCode(Integer classNum, Integer regionCode);

    Optional<User> findByUserEmail(String userEmail);


    List<User> findByIsAdminAndAlarm(int isAdmin, int Alaram);
}
