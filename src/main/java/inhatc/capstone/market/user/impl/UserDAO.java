package inhatc.capstone.market.user.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import inhatc.capstone.market.common.impl.AbstractDAO;
import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.shopping.ShoppingVO;
import inhatc.capstone.market.user.UserVO;
import inhatc.capstone.market.user.CustomerVO;
import inhatc.capstone.market.user.SellerVO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO{
	
	public int selectUserID(UserVO vo) {
		return Integer.valueOf(String.valueOf(selectOne("user.selectUserID", vo)));
	}

	public UserVO selectUserInfo(UserVO vo) {
		// TODO Auto-generated method stub
		// object로 오는 걸 캐스팅
		return (UserVO) selectOne("user.selectUserInfo", vo);
	}
	
	public void insertUserData(UserVO vo) {
		insert("user.insertUserData", vo);
	}
	
	public void insertSallerData(UserVO vo) {
		insert("user.insertSallerData", vo);
	}
	
	public CustomerVO selectCustomerInfo(UserVO vo) {
		return (CustomerVO) selectOne("user.selectCustomerInfo", vo);
	}
	
	public void insertCustomerAddress(CustomerVO vo) {
		insert("user.insertCustomerAddress", vo);
	}
	
	public void updateCustomerAddress(CustomerVO vo) {
		insert("user.updateCustomerAddress", vo);
	}
	
	public SellerVO selectSellerInfo(UserVO vo) {
		return (SellerVO) selectOne("user.selectSellerInfo", vo);
	}
	
	public FindMarketVO selectMarketInfo(UserVO vo) {
		return (FindMarketVO) selectOne("findMarketDAO.selectSellerMarketInfo", vo);
	}
	
	public void insertMarketInfo(FindMarketVO vo) {
		insert("findMarketDAO.insertMarketInfo", vo);
	}
	
	public void updateMarketInfo(FindMarketVO vo) {
		insert("findMarketDAO.updateMarketInfo", vo);
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
