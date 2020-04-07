package com.jsk.stay.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.jsk.stay.dao.LoginDao;
import com.jsk.stay.dto.MemberDto;
import com.jsk.stay.util.Constant;

//spring security�� ����ϸ� Ŭ���̾�Ʈ���� ��û(j_spring_security_check)�ϸ� �̰����� ��û��
public class CustomUserDetailsService implements UserDetailsService{
	
	@Override //security���� ȣ���ϴ� �޼���
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		LoginDao dao = Constant.dao;
		MemberDto dto = dao.login(username);
		
		System.out.println("dto" + dto);
		if(dto == null) {
			System.out.println("null");
			throw  new UsernameNotFoundException("No user found with username");
		}
		String pw = dto.getMb_pwd();
		System.out.println("pw : " + pw);
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		roles.add(new SimpleGrantedAuthority(dto.getMb_grade())); //����
		System.out.println("roles : " + roles);
		UserDetails user = new User(username, pw , roles);
		System.out.println(user);
		return user;
	}
}
