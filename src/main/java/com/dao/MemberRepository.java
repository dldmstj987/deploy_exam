package com.dao;

import java.util.ArrayList;

import com.dto.Member;



public class MemberRepository {
	private final ArrayList<Member> members = new ArrayList<>();
	private static final MemberRepository instance = new MemberRepository();
	
	public static MemberRepository getInstance() {
		return instance;
	}
	
	public MemberRepository() {
		Member member1 = new Member("test", "1234");
		member1.setAddress("대구");
		member1.setBirthday("19980704");
		member1.setEmail("test@naver.com");
		member1.setGender("여자");
		member1.setMemberName("이은서");
		member1.setPhone("010-1234-5678");
		
		members.add(member1);
		
	}
	
	public ArrayList<Member> getAllMembers(){
		
		return members;
	}
	
	public Member getProductById(String memberId) {
		Member member = null;
		
		for(Member m: members) {
			if(m.getMemberId().equals(memberId)) {
				//매개변수와 갹체의 id가 같으면
				member = m;
				break;
			}
		}
		return member;
	}


	public void addMember(Member member) {
		members.add(member);
	}
	
	
	
}	
