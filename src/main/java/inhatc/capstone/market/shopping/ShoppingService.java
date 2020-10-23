package inhatc.capstone.market.shopping;

import java.util.List;
import java.util.Map;

import inhatc.capstone.market.common.SearchVO;
import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.user.UserVO;

public interface ShoppingService {
	FindMarketVO selectUserDefaultShop(UserVO vo);
	List<ShoppingVO> selectShopProductList(Map<String, Object> map)throws Exception;
	ShoppingVO selectProductForm(SearchVO searchVO);
	int selectProductAmount(SearchVO searchVO);
	void updateProductAmount(ShoppingVO vo);
	Integer selectShoppingCartAmount(ShoppingCartVO scv);
	void insertShoppingCart(ShoppingCartVO scv);
	void updateShoppingCart(ShoppingCartVO scv);
}
