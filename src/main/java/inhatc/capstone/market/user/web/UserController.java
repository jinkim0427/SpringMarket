package inhatc.capstone.market.user.web;

import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import inhatc.capstone.market.user.UserService;
import inhatc.capstone.market.user.UserVO;

@Controller
public class UserController {
	
	@Resource(name="userService")
	private UserService userService;
	
	
	
	@RequestMapping(value = "/signUp.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "/user/user-signUp";
	}
	
	@RequestMapping(value = "/signUpTermIndividual.do", method = RequestMethod.GET)
	public String signUpTermIndividual(Locale locale, Model model) {
		
		return "/user/individual-signUp-term";
	}
	
	@RequestMapping(value = "/signUpInfoIndividual.do", method = RequestMethod.GET)
	public String signUpInfoIndividual(Locale locale, Model model) {
		
		return "/user/individual-signUp-info";
	}
	
	@RequestMapping(value = "/signUpTermSales.do", method = RequestMethod.GET)
	public String signUpTermSales(Locale locale, Model model) {
		
		return "/user/sales-signUp-term";
	}
	
	@RequestMapping(value = "/signUpInfoSales.do", method = RequestMethod.GET)
	public String signUpInfoSales(Locale locale, Model model) {
		
		return "/user/sales-signUp-info";
	}
	
	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPage(Locale locale, Model model) throws Exception {
		UserVO userVO = new UserVO();
		userVO.setId("root");
		
		UserVO tempVO = new UserVO();
		tempVO = userService.selectUserInfo(userVO);
		//tempVO.getId();
		//tempVO.getName();
		//tempVO.getPwd();
		System.out.println(tempVO.toString());
		//model.addAttribute("사용할 변수이름", userService.selectUserInfo(userVO));
		
		//return "/user/individual-myPage";
		//위는 이용자 아래는 판매자 나중에 if 문으로 갈려서 보낼수있도록함
		return "/user/sales-myPage";
	}
}
