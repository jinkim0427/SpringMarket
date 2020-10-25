package inhatc.capstone.market.shopping.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import inhatc.capstone.market.common.SearchVO;
import inhatc.capstone.market.findMarket.FindMarketService;
import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.shopping.OrderVO;
import inhatc.capstone.market.shopping.ShoppingCartVO;
import inhatc.capstone.market.shopping.ShoppingService;
import inhatc.capstone.market.shopping.ShoppingVO;
import inhatc.capstone.market.user.UserVO;

@Controller
public class ShoppingController {
	
	@Resource(name = "shoppingService")
	private ShoppingService shoppingService;
	
	@Resource(name = "findMarketService")
	private FindMarketService findMarketService;
	
	final String[] ko_category = {"과자","냉동 식품","라면","도시락","채소","과일",
			"수산","축산","통조림","빵","생활용품","음료"};
	
	@RequestMapping(value = "/shopping.do", method = RequestMethod.GET)
	public ModelAndView shopping(HttpServletRequest request) {
		UserVO userVO = (UserVO)request.getSession().getAttribute("loginInfo");
		
		FindMarketVO fmv =shoppingService.selectUserDefaultShop(userVO);
		
		
		ModelAndView mv = new ModelAndView("/shopping/order-completed");
		mv.addObject("mk_info", fmv);
		//잠시 잠금
		/*
		 * ModelAndView mv = new ModelAndView("/shopping/shopping");
		 
		 */
		//return "/shopping/shopping-detail";
		return mv;
	}

	@RequestMapping(value = "/shoppingDetail.do", method = RequestMethod.POST)
	public ModelAndView shoppingDetail(HttpServletRequest request,  @RequestParam("selectedCategory") int category) throws Exception {
		//System.out.println(category);
		UserVO userVO = (UserVO)request.getSession().getAttribute("loginInfo");
		FindMarketVO fmv =shoppingService.selectUserDefaultShop(userVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mk_number", fmv.getMk_number());
		map.put("pd_category", category);

		List<ShoppingVO> productList = new ArrayList<>();
		try {
			productList = shoppingService.selectShopProductList(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView("/shopping/shopping-detail");
		mv.addObject("mk_info", fmv);
		mv.addObject("ko_category",ko_category[category-1]);
		mv.addObject("productList",productList);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/createAddCartForm.do", method=RequestMethod.GET)
	public ShoppingVO createAddCartForm(@RequestParam(value="searchKey") int searchKey, HttpServletRequest request) throws Exception{
		SearchVO searchVO = new SearchVO();
		searchVO.setSearchKey(searchKey);
		ShoppingVO svo = shoppingService.selectProductForm(searchVO);
		return svo;
	}
	
	@ResponseBody
	@RequestMapping(value="/checkProductAmount.do", method=RequestMethod.GET)
	public int checkProductAmount(@RequestParam(value="searchKey") int searchKey,
			@RequestParam(value="minusAmount") int minusAmount, HttpServletRequest request) throws Exception{
		//체크해서 되면 1 안되면 0
		//System.out.println(searchKey + " " + minusAmount);
		SearchVO searchVO = new SearchVO();
		searchVO.setSearchKey(searchKey);
		int productAmount = shoppingService.selectProductAmount(searchVO);
		int result = 1; //0:매진 1:가능 2:불가능
		if(productAmount == 0) {
			result = 0;
		}else if(productAmount > 0){
			int check = productAmount - minusAmount;
			if(check < 0) {
				result = 2;
			}else {
				result = 1;
			}
		}
		//System.out.println(productAmount);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/addCart.do", method=RequestMethod.GET)
	public int addCart(@RequestParam(value="minusAmount") int amount,
			@RequestParam(value="pd_number") int pd_number, HttpServletRequest request) throws Exception{
		UserVO userVO = (UserVO)request.getSession().getAttribute("loginInfo");
		SearchVO searchVO = new SearchVO();
		searchVO.setSearchKey(pd_number);
		int productAmount = shoppingService.selectProductAmount(searchVO);
		int result = 1;
		if(productAmount == 0) {
			result = 0;
		}else if(productAmount > 0){
			int pd_amount = productAmount - amount;
			if(pd_amount < 0) {
				result = 2;
			}else {
				result = 1;
				//update쿼리
				ShoppingVO vo = new ShoppingVO();
				vo.setPd_amount(pd_amount);
				vo.setPd_number(pd_number);
				shoppingService.updateProductAmount(vo);
				ShoppingCartVO scv = new ShoppingCartVO();
				scv.setId(userVO.getId());
				scv.setPd_number(pd_number);
				Integer sc_amount = shoppingService.selectShoppingCartAmount(scv);
				
				 
				if(null == sc_amount) {
					scv.setSc_amount(amount);
					shoppingService.insertShoppingCart(scv);
				}else {
					scv.setSc_amount(sc_amount+amount);
					shoppingService.updateShoppingCart(scv);
				}
			}
		}		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/getShoppingCartList.do", method = RequestMethod.GET)
	public List<Map<String,Object>> getShoppingCartList(HttpServletRequest request){
		UserVO userVO = (UserVO)request.getSession().getAttribute("loginInfo");
		//Map<String, Object> map = new HashMap<String,Object>();
		
		List<Map<String,Object>> shoppingCartList = new ArrayList<>();
		shoppingCartList = shoppingService.selectShoppingCartList(userVO);
		//System.out.println(shoppingCartList.get(0).get("pd_number"));
		return shoppingCartList;
	}
	
	

	@ResponseBody
	@RequestMapping(value="/updateMinusProductAmount.do", method = RequestMethod.GET)
	public int updateMinusProductAmount(@RequestParam(value="pd_number") int pd_number, HttpServletRequest request){
		UserVO userVO = (UserVO)request.getSession().getAttribute("loginInfo");
		int result = 1; // 0:없음 1:가능 2:불가능
		ShoppingCartVO scv = new ShoppingCartVO();
		scv.setId(userVO.getId());
		scv.setPd_number(pd_number);
		Integer sc_amount = shoppingService.selectShoppingCartAmount(scv);
		//System.out.println(sc_amount);
		if(sc_amount == null) {
			result = 0;
		}else {
			int ch_amount = sc_amount-1;
			if(ch_amount <= 0) {
				result = 2;
			}else {
				//update 구문
				result = 1;
				scv.setSc_amount(ch_amount);
				shoppingService.updateShoppingCart(scv);
				//여기서 1빼서 shoppingcart줄어들엇으면 다시 물건파는 pd는 1 올려줘야뎀
				SearchVO searchVO = new SearchVO();
				searchVO.setSearchKey(pd_number);
				int pd_amount = shoppingService.selectProductAmount(searchVO);
				ShoppingVO vo = new ShoppingVO();
				vo.setPd_amount(pd_amount+1);
				vo.setPd_number(pd_number);
				shoppingService.updateProductAmount(vo);
			}
		}

		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/updatePlusProductAmount.do", method = RequestMethod.GET)
	public int updatePlusProductAmount(@RequestParam(value="pd_number") int pd_number, HttpServletRequest request){
		UserVO userVO = (UserVO)request.getSession().getAttribute("loginInfo");
		int result = 1; // 0:없음 1:가능
		ShoppingCartVO scv = new ShoppingCartVO();
		scv.setId(userVO.getId());
		scv.setPd_number(pd_number);
		Integer sc_amount = shoppingService.selectShoppingCartAmount(scv);
		//내가 장바구니에 담은 갯수 가지고 오고
		SearchVO searchVO = new SearchVO();
		searchVO.setSearchKey(pd_number);
		int pd_amount = shoppingService.selectProductAmount(searchVO);
		//현재 올리려는 물품의 갯수를 가지고 오고 
		if(pd_amount == 0) {
			result = 0;
		}else if(pd_amount >= 1) {
			result = 1;
			ShoppingVO vo = new ShoppingVO();
			vo.setPd_amount(pd_amount-1);
			vo.setPd_number(pd_number);
			shoppingService.updateProductAmount(vo);
			int ch_amount = sc_amount + 1; 
			scv.setSc_amount(ch_amount);
			shoppingService.updateShoppingCart(scv);
		}
		
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/deleteShoppingCartProduct.do", method = RequestMethod.GET)
	public void deleteProductShoppingCart(@RequestParam(value="pd_number") int pd_number, HttpServletRequest request){
		UserVO userVO = (UserVO)request.getSession().getAttribute("loginInfo");
		int result = 1; // 0:없음 1:가능
		//일단 delete 하기 전에 갯수 부터 가지고 오고
		//자기가 쇼핑카트에 있떤거 삭제하고
		//갯수를 원래 product에 집어 넣어줌
		
		ShoppingCartVO scv = new ShoppingCartVO();
		scv.setId(userVO.getId());
		scv.setPd_number(pd_number);
		Integer sc_amount = shoppingService.selectShoppingCartAmount(scv);
		
		shoppingService.deleteShoppingCartProduct(scv);
		
		SearchVO searchVO = new SearchVO();
		searchVO.setSearchKey(pd_number);
		int pd_amount = shoppingService.selectProductAmount(searchVO);
		
		ShoppingVO vo = new ShoppingVO();
		vo.setPd_amount(pd_amount+sc_amount);
		vo.setPd_number(pd_number);
		shoppingService.updateProductAmount(vo);
		
	}
	
	@RequestMapping(value="/orderProduct.do", method=RequestMethod.POST)
	public ModelAndView orderProduct(HttpServletRequest request, 
			@RequestParam("selectedPickUp") String pickUp, @RequestParam("selectedPayment") String payment,
			@RequestParam("orderAddress") String od_address) throws Exception {
		//System.out.println(pickUp +" "+ payment+" "+ od_address);
		UserVO userVO = (UserVO)request.getSession().getAttribute("loginInfo");
		//장바구니에서 order로 넘어가는거
		//유저 아이디로 현재 장바구니에 담아둔 쇼핑카트 불러오기
		List<Map<String,Object>> userShoppingCartList = getShoppingCartList(request);
		
		//쇼핑카트 초기화 하기
		int cnt = shoppingService.selectShoppingCartCount(userVO);
		shoppingService.deleteAllShoppingCartProduct(userVO);
		
		//orders테이블 생성
		int mk_number = findMarketService.selectUserChoiceMarket(userVO);
		OrderVO odVO = new OrderVO();
		odVO.setId(userVO.getId());
		odVO.setMk_number(mk_number);
		odVO.setOd_pickup(pickUp);
		
		shoppingService.insertOrders(odVO);
		//orders-product 만들기
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < cnt ; i++) {
			map.clear();
			//System.out.println(userShoppingCartList.get(i).get("pd_number"));
			map.put("pd_number", userShoppingCartList.get(i).get("pd_number"));
			//System.out.println(userShoppingCartList.get(i).get("sc_amount"));
			map.put("op_amount", userShoppingCartList.get(i).get("sc_amount"));
			map.put("id", userVO.getId());
			shoppingService.insertOrderProduct(map);
		}
		ModelAndView mv = new ModelAndView("/user/individual-myPage");
		return mv;
	}
	
}
