package inhatc.capstone.market.user;

public interface UserService {
	
	int selectUserID(UserVO vo) throws Exception;
	UserVO selectUserInfo(UserVO vo) throws Exception;
	void insertUserData(UserVO vo)throws Exception;
	void insertSallerData(UserVO vo)throws Exception;
	
}
