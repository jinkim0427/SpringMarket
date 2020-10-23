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
import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.shopping.ShoppingCartVO;
import inhatc.capstone.market.shopping.ShoppingService;
import inhatc.capstone.market.shopping.ShoppingVO;
import inhatc.capstone.market.user.UserVO;

@Controller
public class ShoppingController {
	
	@Resource(name = "shoppingService")
	private ShoppingService shoppingService;
	
	final String[] ko_category = {"과자","냉동 식품","라면","도시락","채소","과일",
			"수산","축산","통조림","빵","생활용품","음료"};
	
	@RequestMapping(value = "/shopping.do", method = RequestMethod.GET)
	public ModelAndView shopping(HttpServletRequest request) {
		UserVO userVO = (UserVO)request.getSession().getAttribute("loginInfo");
		
		FindMarketVO fmv =shoppingService.selectUserDefaultShop(userVO);
		
		ModelAndView mv = new ModelAndView("/shopping/shopping");
		mv.addObject("mk_info", fmv);
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
}
