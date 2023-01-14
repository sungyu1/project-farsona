package com.smhrd.database;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//maven project와 mybatis(db환경설정)를 연결
public class SqlSessionManager { //DB 연결, 연결해제와 같은 작업들을 해준다.
	public static SqlSessionFactory sqlSession;
	
	static {
		//myBatis 설정파일 경로 -> db 연결
		String resource = "com/smhrd/database/mybatis-config.xml";
		Reader reader;
		try {
			reader = Resources.getResourceAsReader(resource);
			//sqlSessionFactory : Sqlsession(db연결, sql 실행, 트랜잭션 관리) 생성
			sqlSession = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//dao(class) 사용
	public static SqlSessionFactory getSqlSession() {
		return sqlSession;
	}
}
