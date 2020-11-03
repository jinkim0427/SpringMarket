package inhatc.capstone.market.user;

import inhatc.capstone.market.findMarket.FindMarketVO;

public interface UserService {
	
	int selectUserID(UserVO vo) throws Exception;
	UserVO selectUserInfo(UserVO vo) throws Exception;
	void insertUserData(UserVO vo)throws Exception;
	void insertSallerData(UserVO vo)throws Exception;
	CustomerVO selectCustomerInfo(UserVO vo) throws Exception;
	void insertCustomerAddress(CustomerVO vo)throws Exception;
	void updateCustomerAddress(CustomerVO vo)throws Exception;
	SellerVO selectSellerInfo(UserVO vo) throws Exception;
	FindMarketVO selectMarketInfo(UserVO vo) throws Exception;
	void insertMarketInfo(FindMarketVO vo)throws Exception;
	void updateMarketInfo(FindMarketVO vo)throws Exception;
	
}
