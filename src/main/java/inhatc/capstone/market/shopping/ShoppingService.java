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
	List<Map<String, Object>> selectShoppingCartList(UserVO userVO);
	void deleteShoppingCartProduct(ShoppingCartVO scv);
	void deleteAllShoppingCartProduct(UserVO userVO);
	void insertOrders(OrderVO odVO);
	int selectShoppingCartCount(UserVO userVO);
	void insertOrderProduct(Map<String, Object> map);
	void insertOrderDelivery(Map<String, Object> addressMap);
	OrderVO selectNewOrderInfo(UserVO userVO);
	String selectSalesInfo(FindMarketVO fmv);
	Integer selectSalesCheck(UserVO userVO);
	
	List<Map<String,Object>> selectUserOrder(OrderVO vo);
	List<Map<String,Object>> selectMarketOrder(OrderVO vo);
	List<Map<String,Object>> selectOrderInfo(OrderVO vo);
	void updateOrderStatus(OrderVO vo);
	List<ShoppingVO> selectProductList(ShoppingVO vo);
	void deleteProduct(ShoppingVO vo);
	void updateProduct(List<ShoppingVO> list);
	void insertProduct(ShoppingVO vo);
}
