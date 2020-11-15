package inhatc.capstone.market.msg.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import inhatc.capstone.market.user.UserVO;

@Controller
public class MsgController {
	
	@RequestMapping(value="/msg/websocketMessengerView.do", method = RequestMethod.GET)
	public ModelAndView websocketMessengerView(HttpServletRequest request) {
		System.out.println("msgView.do 들어왔습니다.");
		UserVO userVO = (UserVO)request.getSession().getAttribute("loginInfo");
		//model.addAttribute("loginVO", session.getAttribute("loginInfo"));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test/messenger");
		mav.addObject("UserVO", userVO);
		return mav;
	}
	
	
	@RequestMapping(value="/msg/websocketMessengerMain.do")
	public ModelAndView websocketMessengerMain(HttpServletRequest request) {
		System.out.println("msgMain.do 들어왔습니다.");
		UserVO userVO = (UserVO)request.getSession().getAttribute("loginInfo");
		//model.addAttribute("loginVO", session.getAttribute("loginInfo"));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test/messengerMain");
		mav.addObject("UserVO", userVO);
		return mav;
	}
	
	
	@RequestMapping(value="/msg/websocketMessengePopup.do")
	public ModelAndView websocketMessengePopup(@RequestParam(value="roomId") String roomId,
										 @RequestParam(value="username") String username,
										 HttpServletRequest request) {
		UserVO userVO = (UserVO)request.getSession().getAttribute("loginInfo");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test/chatPopup");
		mav.addObject("UserVO", userVO);
		mav.addObject("roomId", roomId);
		mav.addObject("username", username); //본인이 아닌 선택한 상대방
		return mav;
	}
	
}
