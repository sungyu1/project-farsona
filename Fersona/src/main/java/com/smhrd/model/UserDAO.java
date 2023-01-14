package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class UserDAO {
	
	// 세션을 생성해줄 수 있는 factory 생성
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 세션 생성(sql 실행, close(), 연결(connection))
	SqlSession sqlSession = sqlSessionFactory.openSession();

	
	// 일반 사용자 정보 조회
	public List<User> selectAllMember() {
		List<User> list = null;
		try {
			list = sqlSession.selectList("com.smhrd.model.UserDAO.selectAllMember");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
	
	// 일반 사용자 정보 삭제
	public int deleteMember(String mem_id) {
		int cnt = 0;
		try {
			cnt = sqlSession.delete("com.smhrd.model.UserDAO.deleteMember",mem_id);
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
	
	// 일반 사용자 정보 특정 개수만큼만 조회
	public List<User> selectAllListPage(int num) {
		List<User> list = null;
		try {
			list = sqlSession.selectList("com.smhrd.model.UserDAO.selectAllListPage",num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}


	
}
