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
import org.springframework.web.servlet.ModelAndView;

import inhatc.capstone.market.findMarket.FindMarketVO;
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
	
	
}
