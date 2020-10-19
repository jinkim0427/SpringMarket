package inhatc.capstone.market.shopping.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import inhatc.capstone.market.common.impl.AbstractDAO;
import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.shopping.ShoppingVO;
import inhatc.capstone.market.user.UserVO;

@Repository("shoppingDAO")
public class ShoppingDAO extends AbstractDAO{

	public FindMarketVO selectUserDefaultShop(UserVO vo) {
		// TODO Auto-generated method stub
		return (FindMarketVO) selectOne("shoppingDAO.selectUserDefaultShop",vo);
	}

	public List<ShoppingVO> selectShopProductList(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		return selectList("shoppingDAO.selectShopProductList", map);
	}

}
