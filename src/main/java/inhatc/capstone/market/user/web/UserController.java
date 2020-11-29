package inhatc.capstone.market.user.web;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import inhatc.capstone.market.findMarket.FindMarketService;
import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.map.MapService;
import inhatc.capstone.market.map.MapVO;
import inhatc.capstone.market.user.CustomerVO;
import inhatc.capstone.market.user.SellerVO;
import inhatc.capstone.market.user.UserService;
import inhatc.capstone.market.user.UserVO;

@Controller
public class UserController {
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="mapService")
	private MapService mapService;
	
	@Resource(name="findMarketService")
	private FindMarketService findMarketService;
	
	@RequestMapping(value = "/signUp.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "/user/user-signUp";
	}
	
	@RequestMapping(value = "/signUpTermIndividual.do", method = RequestMethod.GET)
	public String signUpTermIndividual(Locale locale, Model model) {
		
		return "/user/individual-signUp-term";
	}
	
	@RequestMapping(value = "/signUpTermSales.do", method = RequestMethod.GET)
	public String signUpTermSales(Locale locale, Model model) {
		
		return "/user/sales-signUp-term";
	}
	
	@RequestMapping(value = "/signUpInfo.do", method = RequestMethod.POST)
	public ModelAndView signUpInfo(HttpServletRequest request) {
		
		String acc = request.getParameter("userAcc");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/user-signUp-info");
		mv.addObject("signAcc", acc);
		
		return mv;
	}
	
	@RequestMapping(value = "/checkUserID.do", method = RequestMethod.POST)
	@ResponseBody
	public int checkUserID(HttpServletRequest request) throws Exception {
		
		UserVO userVO = new UserVO();
		userVO.setId(request.getParameter("id"));
		int result = userService.selectUserID(userVO);
		
		return result;
	}
	
	@RequestMapping(value = "/insertUserData.do", method = RequestMethod.POST)
	public ModelAndView insertUserData(HttpServletRequest request) throws Exception {
		
		UserVO userVO = new UserVO();
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder(10);
		String encodePwd = bpe.encode(request.getParameter("signPwd"));
		
		userVO.setId(request.getParameter("signId"));
		userVO.setPassword(encodePwd);
		userVO.setName(request.getParameter("signName"));
		userVO.setTel(request.getParameter("signPhone"));
		userVO.setEmail(request.getParameter("signEmail"));
		userVO.setAcc(request.getParameter("signAcc"));
		userService.insertUserData(userVO);
		if(userVO.getAcc().equals("sales")) userService.insertSallerData(userVO);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home/popup");
		mv.addObject("msg","회원가입을 완료하였습니다.");
		mv.addObject("loc","/home.do");
		
		return mv;
	}
	
	@RequestMapping(value = "/loginUser.do", method = RequestMethod.POST)
	public ModelAndView loginUser(HttpServletRequest request) throws Exception {
		
		UserVO userVO = new UserVO();
		UserVO resultVO = new UserVO();
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder(10);
		ModelAndView mv = new ModelAndView();
		String msg;
			
		userVO.setId(request.getParameter("loginId"));
		userVO.setPassword(request.getParameter("loginPwd"));
		resultVO = userService.selectUserInfo(userVO);

		if(resultVO == null) msg = "로그인 정보가 올바르지 않습니다.";
		else {
			boolean result = bpe.matches(userVO.getPassword(), resultVO.getPassword());
			if(result) {
				request.getSession().setAttribute("loginInfo", resultVO);
				request.getSession().setMaxInactiveInterval(60*30); //세션 사라지는 시간
				msg = "로그인 하였습니다.";
			}
			else msg = "로그인 정보가 올바르지 않습니다.";
		}
		
		mv.setViewName("home/popup");
		mv.addObject("msg", msg);
		mv.addObject("loc","/home.do");
		
		return mv;
	}
	
	@RequestMapping(value = "/logoutUser.do", method = RequestMethod.GET)
	public ModelAndView logoutUser(HttpServletRequest request) {
		
		request.getSession().removeAttribute("loginInfo");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home/popup");
		mv.addObject("msg", "로그아웃 하였습니다.");
		mv.addObject("loc","/home.do");
		return mv;
	}
	
	@RequestMapping(value = "/needLogin.do", method = RequestMethod.GET)
	public ModelAndView needLogin() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("home/popup");
		mv.addObject("msg", "로그인이 필요합니다.");
		mv.addObject("loc","/home.do");
		return mv;
	}
	
	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request) throws Exception {
		
		UserVO user = (UserVO)request.getSession().getAttribute("loginInfo");
		ModelAndView mv = new ModelAndView();
		
		if (user.getAcc().equals("customer")) {
			mv.setViewName("user/individual-myPage");
			CustomerVO customer = new CustomerVO();
			customer = userService.selectCustomerInfo(user);
			if(customer != null) {
				mv.addObject("customerInfo", customer);
			}
		}
		else if(user.getAcc().equals("sales")) {
			mv.setViewName("user/sales-myPage");
			SellerVO seller = new SellerVO();
			FindMarketVO market = new FindMarketVO();
			MapVO mapInfo = new MapVO();
			
			seller = userService.selectSellerInfo(user);
			market = userService.selectMarketInfo(user);
			if(market != null) {
				mapInfo.setMk_number(market.getMk_number());
				
				if(mapService.selectMapInfo(mapInfo) != null) {
					mapInfo = mapService.selectMapInfo(mapInfo) ;
				}
			}
			
			
			
			
			mv.addObject("sellerInfo", seller);
			mv.addObject("UserVO", user);
			if(market != null) {
				mv.addObject("marketInfo", market);
				
			}
			String appkey = "7a4d4e173226350a5760087585340115"; 
			mv.addObject("appkey",appkey);
			mv.addObject("mapInfo", mapInfo);
		}	
		return mv;
	}
	
	@RequestMapping(value = "/updateMyInfo.do", method = RequestMethod.GET)
	@ResponseBody
	public void updateMyInfo(HttpServletRequest request) throws Exception {
		
		UserVO user = (UserVO)request.getSession().getAttribute("loginInfo");
		CustomerVO customer = new CustomerVO();
		CustomerVO result = new CustomerVO();
		customer.setId(user.getId());
		customer.setAddress(request.getParameter("address"));
		result = userService.selectCustomerInfo(user);
		if(result == null) userService.insertCustomerAddress(customer);
		else userService.updateCustomerAddress(customer);			
	}
	
	@RequestMapping(value = "/updateMarketInfo.do", method = RequestMethod.GET)
	@ResponseBody
	public void updateMarketInfo(HttpServletRequest request) throws Exception {
		UserVO user = (UserVO)request.getSession().getAttribute("loginInfo");
		
		FindMarketVO market = new FindMarketVO();
		if(request.getParameter("mk_number").equals("")) market.setMk_number(-1); 
		else market.setMk_number(Integer.parseInt(request.getParameter("mk_number")));
		market.setSeller_number(Integer.parseInt(request.getParameter("seller_number")));
		market.setMk_name(request.getParameter("mk_name"));
		market.setMk_address(request.getParameter("mk_address"));
		market.setMk_tel(request.getParameter("mk_tel"));
		market.setMk_state(Boolean.valueOf(request.getParameter("mk_state")));
		market.setMk_delivery(Boolean.valueOf(request.getParameter("mk_delivery")));
		market.setMk_intro(request.getParameter("mk_intro"));
		
		MapVO mapVO = new MapVO();
		mapVO.setMp_address(request.getParameter("mp_address"));
		mapVO.setMp_lat(Double.parseDouble(request.getParameter("mp_lat")));
		mapVO.setMp_lon(Double.parseDouble(request.getParameter("mp_lon")));
		// 경우
		// 1처음 등록하는 경우 2수정하는경우 3마켓정보는 있는데 지도를 처음하는 경우
		if(market.getMk_number() > 0) {
			userService.updateMarketInfo(market);
			mapVO.setMk_number(market.getMk_number());
			if(mapService.selectMapInfo(mapVO) != null && mapVO.getMp_address() != null) {
				//마켓정보도 있고 지도정보도 있는 경우 (지도변경)
				mapService.updateMapInfo(mapVO);
			}else {
				//마켓정보는 있지만 지도정보는 처음 넣는 경우
				mapService.insertMapInfo(mapVO);
			}
		}else {
			//마켓정보도 신규 지도도 등록
			userService.insertMarketInfo(market);
			FindMarketVO fmv = new FindMarketVO();
			fmv = findMarketService.selectSellerMarketInfo(user);
			mapVO.setMk_number(fmv.getMk_number());
			mapService.insertMapInfo(mapVO);
			
		}
		
		
		
		
	}
	
}
