package inhatc.capstone.market.shopping.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import inhatc.capstone.market.common.SearchVO;
import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.shopping.OrderVO;
import inhatc.capstone.market.shopping.ShoppingCartVO;
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
	@Override
	public ShoppingVO selectProductForm(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return shoppingDAO.selectProductForm(searchVO);
	}
	@Override
	public int selectProductAmount(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return shoppingDAO.selectProductAmount(searchVO);
	}
	@Override
	public void updateProductAmount(ShoppingVO vo) {
		// TODO Auto-generated method stub
		shoppingDAO.updateProductAmount(vo);
	}
	@Override
	public Integer selectShoppingCartAmount(ShoppingCartVO scv) {
		// TODO Auto-generated method stub
		return shoppingDAO.selectShoppingCartAmount(scv);
	}
	@Override
	public void insertShoppingCart(ShoppingCartVO scv) {
		// TODO Auto-generated method stub
		shoppingDAO.insertShoppingCart(scv);
	}
	@Override
	public void updateShoppingCart(ShoppingCartVO scv) {
		// TODO Auto-generated method stub
		shoppingDAO.updateShoppingCart(scv);
	}
	@Override
	public List<Map<String, Object>> selectShoppingCartList(UserVO userVO) {
		// TODO Auto-generated method stub
		return shoppingDAO.selectShoppingCartList(userVO);
	}
	@Override
	public void deleteShoppingCartProduct(ShoppingCartVO scv) {
		// TODO Auto-generated method stub
		shoppingDAO.deleteShoppingCartProduct(scv);
	}
	@Override
	public void deleteAllShoppingCartProduct(UserVO userVO) {
		// TODO Auto-generated method stub
		shoppingDAO.deleteAllShoppingCartProduct(userVO);
	}
	@Override
	public void insertOrders(OrderVO odVO) {
		// TODO Auto-generated method stub
		shoppingDAO.insertOrders(odVO);
	}
	@Override
	public int selectShoppingCartCount(UserVO userVO) {
		// TODO Auto-generated method stub
		return shoppingDAO.selectShoppingCartCount(userVO);
	}
	@Override
	public void insertOrderProduct(Map<String, Object> map) {
		// TODO Auto-generated method stub
		shoppingDAO.insertOrderProduct(map);
	}
	@Override
	public void insertOrderDelivery(Map<String, Object> addressMap) {
		// TODO Auto-generated method stub
		shoppingDAO.insertOrderDelivery(addressMap);
	}
	@Override
	public OrderVO selectNewOrderInfo(UserVO userVO) {
		// TODO Auto-generated method stub
		return shoppingDAO.selectNewOrderInfo(userVO);
	}
	@Override
	public String selectSalesInfo(FindMarketVO fmv) {
		// TODO Auto-generated method stub
		return shoppingDAO.selectSalesInfo(fmv);
	}
	@Override
	public Integer selectSalesCheck(UserVO userVO) {
		// TODO Auto-generated method stub
		return shoppingDAO.selectSalesCheck(userVO);
	}
	
	@Override
	public List<Map<String,Object>>  selectUserOrder(OrderVO vo) {
		// TODO Auto-generated method stub
		return shoppingDAO.selectUserOrder(vo);
	}
	@Override
	public List<Map<String,Object>> selectMarketOrder(OrderVO vo) {
		// TODO Auto-generated method stub
		return shoppingDAO.selectMarketOrder(vo);
	}
	@Override
	public List<Map<String, Object>> selectOrderInfo(OrderVO vo) {
		// TODO Auto-generated method stub
		return shoppingDAO.selectOrderInfo(vo);
	}
	@Override
	public void updateOrderStatus(OrderVO vo) {
		shoppingDAO.updateOrderStatus(vo);
	}
	@Override
	public void insertProduct(ShoppingVO vo) {
		shoppingDAO.insertProduct(vo);
	}
	@Override
	public List<ShoppingVO> selectProductList(ShoppingVO vo) {
		return shoppingDAO.selectProductList(vo);
	}
	@Override
	public void deleteProduct(ShoppingVO vo) {
		shoppingDAO.deleteProduct(vo);
		
	}
	@Override
	public void updateProduct(List<ShoppingVO> list) {
		shoppingDAO.updateProduct(list);
	}

}
