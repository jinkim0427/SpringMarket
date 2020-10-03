package inhatc.capstone.market.user.impl;

import org.springframework.stereotype.Repository;

import inhatc.capstone.market.impl.AbstractDAO;
import inhatc.capstone.market.user.UserVO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO{
	
	public int selectUserID(UserVO vo) {
		return (int) selectOne("user.selectUserID", vo);
	}

	public UserVO selectUserInfo(UserVO vo) {
		// TODO Auto-generated method stub
		// object로 오는 걸 캐스팅
		return (UserVO) selectOne("user.selectUserInfo", vo);
	}
	
}
