package inhatc.capstone.market.findMarket;

import java.util.List;
import java.util.Map;

import inhatc.capstone.market.common.SearchVO;
import inhatc.capstone.market.user.UserVO;

public interface FindMarketService {
	List<FindMarketVO> selectMarketList(SearchVO vo) throws Exception;
	
	Integer selectUserChoiceMarket(UserVO vo) throws Exception;
	
	String selectUserChoiceMarketName(SearchVO vo) throws Exception;
	
	void insertUserChoiceMarket(Map<String, Object> map);
	
	void updateUserChoiceMarket(Map<String, Object> map);
	
	FindMarketVO selectMarketInfo(SearchVO vo);

	FindMarketVO selectSellerMarketInfo(UserVO user);
}
