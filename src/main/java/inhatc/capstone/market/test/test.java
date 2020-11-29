package inhatc.capstone.market.test;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.user.UserVO;

@Controller
public class test {
	
	
	@RequestMapping(value = "/testKaKao.do")
	public ModelAndView testKaKao(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/test/kakaoMap");
		String appkey = "7a4d4e173226350a5760087585340115"; 
		mv.addObject("appkey",appkey);
		return mv;
		
	}
}
