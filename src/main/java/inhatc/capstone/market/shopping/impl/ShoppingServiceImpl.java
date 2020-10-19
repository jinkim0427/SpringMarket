package inhatc.capstone.market.shopping.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.shopping.ShoppingService;
import inhatc.capstone.market.shopping.ShoppingVO;
import inhatc.capstone.market.user.UserVO;

@Service("shoppingService")
public class ShoppingServiceImpl implements ShoppingService{

	@Resource(name = "shoppingDAO")
	private ShoppingDAO shoppingDAO;
	@Override
	public FindMarketVO selectUserDefaultShop(UserVO vo) {
		// TODO Auto-generated method stub
		return shoppingDAO.selectUserDefaultShop(vo);
	}
	@Override
	public List<ShoppingVO> selectShopProductList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return shoppingDAO.selectShopProductList(map);
	}

}
