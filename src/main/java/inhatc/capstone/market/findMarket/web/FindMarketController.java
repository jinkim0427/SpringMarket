package inhatc.capstone.market.findMarket.web;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FindMarketController {
	@RequestMapping(value = "/findMarket.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "/market/findMarket";
	}
}
