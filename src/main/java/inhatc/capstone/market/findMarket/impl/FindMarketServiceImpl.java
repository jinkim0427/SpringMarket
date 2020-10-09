package inhatc.capstone.market.findMarket.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import inhatc.capstone.market.common.SearchVO;
import inhatc.capstone.market.findMarket.FindMarketService;
import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.user.UserVO;

@Service("findMarketService")
public class FindMarketServiceImpl implements FindMarketService{
	@Resource(name = "findMarketDAO")
	private FindMarketDAO findMarketDAO;
	
	@Override
	public List<FindMarketVO> selectMarketList(SearchVO vo) throws Exception {
		// TODO Auto-generated method stub
		return findMarketDAO.selectMarketList(vo);
	}
	/**
	 *  마켓 정보들을 가지고 온다.
	 */
	
	@Override
	public Integer selectUserChoiceMarket(UserVO vo) {
		// TODO Auto-generated method stub
		//return 매장 번호
		return findMarketDAO.selectUserChoiceMarket(vo);
	}
	/**
	 *  유저가 선택한 기본 상점 번호를 가지고 온다.
	 */
	
	@Override
	public String selectUserChoiceMarketName(SearchVO vo) throws Exception {
		// TODO Auto-generated method stub
		return findMarketDAO.selectUserChoiceMarketName(vo);
	}
	/**
	 *  유저가 선택한 기본 상점 이름을 가지고 온다.
	 */
	
	@Override
	public void insertUserChoiceMarket(Map<String, Object> map) {
		// TODO Auto-generated method stub
		findMarketDAO.insertUserChoiceMarket(map);
	}
	/**
	 *  유저가 선택한 기본 상점 번호를 가지고 customer 객체를 생성한다.
	 */
	
	@Override
	public void updateUserChoiceMarket(Map<String, Object> map) {
		// TODO Auto-generated method stub
		findMarketDAO.updateUserChoiceMarket(map);
	}
	/**
	 *  유저가 선택한 기본 상점 번호를 변경한다.
	 */
	
	@Override
	public FindMarketVO selectMarketInfo(SearchVO vo) {
		// TODO Auto-generated method stub
		return findMarketDAO.selectMarketInfo(vo);
	}
	/**
	 *  상점에 대한 detail 자료를 불러온다.
	 */
}
