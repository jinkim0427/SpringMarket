package inhatc.capstone.market.user.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.user.CustomerVO;
import inhatc.capstone.market.user.SellerVO;
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

	@Override
	public void insertUserData(UserVO vo) throws Exception {
		userDAO.insertUserData(vo);
	}

	@Override
	public void insertSallerData(UserVO vo) throws Exception {
		userDAO.insertSallerData(vo);
	}

	@Override
	public CustomerVO selectCustomerInfo(UserVO vo) throws Exception {
		return userDAO.selectCustomerInfo(vo);
	}

	@Override
	public void insertCustomerAddress(CustomerVO vo) throws Exception {
		userDAO.insertCustomerAddress(vo);
	}

	@Override
	public void updateCustomerAddress(CustomerVO vo) throws Exception {
		userDAO.updateCustomerAddress(vo);
	}

	@Override
	public SellerVO selectSellerInfo(UserVO vo) throws Exception {
		return userDAO.selectSellerInfo(vo);
	}

	@Override
	public FindMarketVO selectMarketInfo(UserVO vo) throws Exception {
		return userDAO.selectMarketInfo(vo);
	}

	@Override
	public void insertMarketInfo(FindMarketVO vo) throws Exception {
		userDAO.insertMarketInfo(vo);
	}

	@Override
	public void updateMarketInfo(FindMarketVO vo) throws Exception {
		userDAO.updateMarketInfo(vo);
	}

	
	
}
