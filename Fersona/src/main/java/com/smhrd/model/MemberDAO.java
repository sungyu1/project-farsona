package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {

	// 세션을 생성해줄 수 있는 factory 생성
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 세션 생성(sql 실행, close(), 연결(connection))
	SqlSession sqlSession = sqlSessionFactory.openSession();

	// 회원가입 메서드
	public int insertMember(Member vo) {
		int cnt = 0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.MemberDAO.insertMember", vo);
			if (cnt > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	// 로그인 메서드
	public Member selectMember(Member vo) {
		Member loginMember = null;
		try {
			loginMember = sqlSession.selectOne("com.smhrd.model.MemberDAO.selectMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return loginMember;
	}

	// 사원번호 조회
	public Police checkMember(Police vo) {
		Police loginMember = null;
		try {
			loginMember = sqlSession.selectOne("com.smhrd.model.MemberDAO.checkMember", vo);
			/* System.out.println("sql성공"); */
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("sql실패");
		} finally {
			sqlSession.close();
		}
		return loginMember;
	}
	
	// 가입자 체크
	public boolean idCheck(String inputid) {
		boolean checkID = false;
		try {
			checkID = sqlSession.selectOne("com.smhrd.model.MemberDAO.idCheck", inputid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return checkID;
	}
	
	// 회원정보 수정
	public int updateMember(Member vo) {
		int cnt = 0;
		try {
			cnt = sqlSession.update("com.smhrd.model.MemberDAO.update",vo);
			if(cnt>0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
	}
	


	
}
