package com.java.glowamber.dao.sociallogin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SocialLoginDAOImpl implements SocialLoginDAO {

	@Autowired
	 private SqlSessionTemplate mybatis;

	    
	    

}
