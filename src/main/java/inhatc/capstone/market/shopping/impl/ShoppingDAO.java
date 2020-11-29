package inhatc.capstone.market.shopping.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import inhatc.capstone.market.common.SearchVO;
import inhatc.capstone.market.common.impl.AbstractDAO;
import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.shopping.OrderVO;
import inhatc.capstone.market.shopping.ShoppingCartVO;
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

	public ShoppingVO selectProductForm(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return (ShoppingVO) selectOne("shoppingDAO.selectProductForm", searchVO);
	}

	public int selectProductAmount(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return Integer.valueOf(String.valueOf(selectOne("shoppingDAO.selectProductAmount", searchVO)));
	}

	public void updateProductAmount(ShoppingVO vo) {
		// TODO Auto-generated method stub
		update("shoppingDAO.updateProductAmount",vo);
	}

	public Integer selectShoppingCartAmount(ShoppingCartVO scv) {
		// TODO Auto-generated method stub
		return (Integer) selectOne("shoppingDAO.selectShoppingCartAmount", scv);
	}

	public void insertShoppingCart(ShoppingCartVO scv) {
		// TODO Auto-generated method stub
		insert("shoppingDAO.insertShoppingCart",scv);
	}

	public void updateShoppingCart(ShoppingCartVO scv) {
		// TODO Auto-generated method stub
		update("shoppingDAO.updateShoppingCart",scv);
	}

	public List<Map<String, Object>> selectShoppingCartList(UserVO userVO) {
		// TODO Auto-generated method stub
		return selectList("shoppingDAO.selectShoppingCartList", userVO);
	}

	public void deleteShoppingCartProduct(ShoppingCartVO scv) {
		// TODO Auto-generated method stub
		delete("shoppingDAO.deleteShoppingCartProduct",scv);
	}

	public void deleteAllShoppingCartProduct(UserVO userVO) {
		// TODO Auto-generated method stub
		delete("shoppingDAO.deleteAllShoppingCartProduct",userVO);
	}

	public void insertOrders(OrderVO odVO) {
		// TODO Auto-generated method stub
		insert("shoppingDAO.insertOrders",odVO);
	}

	public int selectShoppingCartCount(UserVO userVO) {
		// TODO Auto-generated method stub
		return Integer.valueOf(String.valueOf(selectOne("shoppingDAO.selectShoppingCartCount",userVO)));
	}

	public void insertOrderProduct(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert("shoppingDAO.insertOrderProduct",map);
	}

	public void insertOrderDelivery(Map<String, Object> addressMap) {
		// TODO Auto-generated method stub
		insert("shoppingDAO.insertOrderDelivery",addressMap);
	}

	public OrderVO selectNewOrderInfo(UserVO userVO) {
		// TODO Auto-generated method stub
		return (OrderVO) selectOne("shoppingDAO.selectNewOrderInfo",userVO);
	}

	public String selectSalesInfo(FindMarketVO fmv) {
		// TODO Auto-generated method stub
		return (String) selectOne("shoppingDAO.selectSalesInfo", fmv);
	}

	public Integer selectSalesCheck(UserVO userVO) {
		// TODO Auto-generated method stub
		return (Integer) selectOne("shoppingDAO.selectSalesCheck", userVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectUserOrder(OrderVO vo) {
		// TODO Auto-generated method stub
		return selectList("shoppingDAO.selectUserOrder", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectMarketOrder(OrderVO vo) {
		// TODO Auto-generated method stub
		return selectList("shoppingDAO.selectMarketOrder", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectOrderInfo(OrderVO vo) {
		// TODO Auto-generated method stub
		return selectList("shoppingDAO.selectOrderInfo", vo);
	}
	
	public void updateOrderStatus(OrderVO vo) {
		update("shoppingDAO.updateOrderStatus", vo);
	}
	
	public void insertProduct(ShoppingVO vo) {
		insert("shoppingDAO.insertProduct", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<ShoppingVO> selectProductList(ShoppingVO vo) {
		return selectList("shoppingDAO.selectShopProductList", vo);
	}
	
	public void deleteProduct(ShoppingVO vo) {
		delete("shoppingDAO.deleteProduct", vo);
	}
	
	public void updateProduct(List<ShoppingVO> list) {
		update("shoppingDAO.updateProducts", list);
	}
}
