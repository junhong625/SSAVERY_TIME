package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.entity.AlarmDefault;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AlarmDefaultRepository extends JpaRepository<AlarmDefault, Long> {

}
