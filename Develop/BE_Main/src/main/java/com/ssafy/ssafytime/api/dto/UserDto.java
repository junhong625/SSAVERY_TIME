package com.ssafy.ssafytime.api.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.ssafy.ssafytime.db.entity.User;
import lombok.*;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;
import java.util.stream.Collectors;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {

   @NotNull
   @Size(min = 3, max = 50)
   private String userName;

   @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
   @NotNull
   @Size(min = 3, max = 100)
   private String password;


   @NotNull
   private String userEmail;


   @NotNull
   private Integer trackCode;

//   private String userImg;

   @NotNull
   private Integer regionCode;

   private Integer exp;

   private Integer mileage;

   private Integer isAdmin;

//   private String token;



   private Set<AuthorityDto> authorityDtoSet;

   public static UserDto from(User user) {
      if(user == null) return null;

      return UserDto.builder()
              .userName(user.getUserName())
              .authorityDtoSet(user.getAuthorities().stream()
                      .map(authority -> AuthorityDto.builder().authorityName(authority.getAuthorityName()).build())
                      .collect(Collectors.toSet()))
              .build();
   }
}