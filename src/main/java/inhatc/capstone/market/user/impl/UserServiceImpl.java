package inhatc.capstone.market.user.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import inhatc.capstone.market.user.UserService;
import inhatc.capstone.market.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Resource(name="userDAO")
	private UserDAO userDAO;
	
	@Override
	public int selectUserID(UserVO vo) throws Exception {
		int result = userDAO.selectUserID(vo);
		return result;
	}
	
	@Override
	public UserVO selectUserInfo(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		UserVO resultVO = userDAO.selectUserInfo(vo);
		return resultVO;
	}

	
	
}
