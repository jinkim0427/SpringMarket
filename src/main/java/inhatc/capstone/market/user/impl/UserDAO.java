package inhatc.capstone.market.user.impl;

import org.springframework.stereotype.Repository;

import inhatc.capstone.market.common.impl.AbstractDAO;
import inhatc.capstone.market.user.UserVO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO{
	
	public int selectUserID(UserVO vo) {
		return Integer.valueOf(String.valueOf(selectOne("user.selectUserID", vo)));
	}

	public UserVO selectUserInfo(UserVO vo) {
		// TODO Auto-generated method stub
		// object로 오는 걸 캐스팅
		return (UserVO) selectOne("user.selectUserInfo", vo);
	}
	
	public void insertUserData(UserVO vo) {
		insert("user.insertUserData", vo);
	}
	
}
