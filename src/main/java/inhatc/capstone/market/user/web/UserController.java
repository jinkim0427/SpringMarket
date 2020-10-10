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
	public String myPage(HttpServletRequest request) throws Exception {
		
		UserVO user = (UserVO)request.getSession().getAttribute("loginInfo");
		if (user.getAcc().equals("customer")) return  "/user/individual-myPage";
		else if(user.getAcc().equals("sales")) return "/user/sales-myPage";
		
		return "/home/main";
		
	}
}
