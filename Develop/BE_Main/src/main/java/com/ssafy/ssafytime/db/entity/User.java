package com.ssafy.ssafytime.db.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
public class User extends BaseTimeEntity {
    @Id
    @Column(name = "user_idx")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id = null;

    @Column(name = "user_name")
    String name;

    @Column(name = "user_password")
    @JsonIgnore
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    String password;

    @Column(name = "user_email")
    String email;

    @Column(name = "track_code")
    Integer trackCode;

    @Column(name = "user_img")
    @Lob
    String userImg;

    @Column(name = "region_code")
    Integer regionCode;

    @Column(name = "exp")
    Integer exp;

    @Column(name = "mileage")
    Integer mileage;

    @Column(name = "is_admin")
    Integer isAdmin;

    @Lob
    String token;
}
