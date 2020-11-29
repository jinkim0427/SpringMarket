package inhatc.capstone.market.findMarket.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import inhatc.capstone.market.common.SearchVO;
import inhatc.capstone.market.common.impl.AbstractDAO;
import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.user.UserVO;

@Repository("findMarketDAO")
public class FindMarketDAO extends AbstractDAO{
	List<FindMarketVO> selectMarketList(SearchVO searchVO) throws Exception {
		return selectList("findMarketDAO.selectMarketList", searchVO);
	}

	public Integer selectUserChoiceMarket(UserVO vo) {
		// TODO Auto-generated method stub
		return (Integer) selectOne("findMarketDAO.selectUserChoiceMarket", vo);
	}

	public String selectUserChoiceMarketName(SearchVO vo) {
		// TODO Auto-generated method stub
		return (String) selectOne("findMarketDAO.selectUserChoiceMarketName", vo);
	}

	public void insertUserChoiceMarket(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert("findMarketDAO.insertUserChoiceMarket", map);
	}

	public void updateUserChoiceMarket(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("findMarketDAO.updateUserChoiceMarket", map);
	}

	public FindMarketVO selectMarketInfo(SearchVO vo) {
		// TODO Auto-generated method stub
		return (FindMarketVO) selectOne("findMarketDAO.selectMarketInfo", vo);
	}

	public FindMarketVO selectSellerMarketInfo(UserVO user) {
		// TODO Auto-generated method stub
		return (FindMarketVO) selectOne("findMarketDAO.selectSellerMarketInfo", user);
	}
}
