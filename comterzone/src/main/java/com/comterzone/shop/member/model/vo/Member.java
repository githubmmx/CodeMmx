package com.comterzone.shop.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {

	private String userId;
	private String password;
	private String userName;
	private int age;
	private String email;
	private String phone;
	private String gender;
	private String address;
	private String[] hobby;

}
