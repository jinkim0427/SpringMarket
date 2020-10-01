package inhatc.capstone.market.shopping.web;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShoppingController {
	@RequestMapping(value = "/shopping.do", method = RequestMethod.GET)
	public String shopping(Locale locale, Model model) {
		
		return "/shopping/shopping-detail";
		//return "/shopping/shopping";
	}
}
