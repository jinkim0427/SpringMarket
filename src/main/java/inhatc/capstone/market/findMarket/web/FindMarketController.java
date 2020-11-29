package inhatc.capstone.market.findMarket.web;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import inhatc.capstone.market.common.SearchVO;
import inhatc.capstone.market.findMarket.FindMarketService;
import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.user.UserVO;

@Controller
public class FindMarketController {
	
	@Resource(name="findMarketService")
	private FindMarketService findMarketService;
	
	@RequestMapping(value = "/findMarket.do", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) throws Exception {
		UserVO userVO = (UserVO)request.getSession().getAttribute("loginInfo");
		
		String mk_name = "";
		Integer mk_number = findMarketService.selectUserChoiceMarket(userVO); 
		if(null == mk_number) {
			mk_name = "기본 마켓 등록이 필요 합니다.";
		}else {
			SearchVO searchVO = new SearchVO();
			searchVO.setSearchKey(mk_number);
			mk_name = findMarketService.selectUserChoiceMarketName(searchVO);
		}
		
		String appkey = "7a4d4e173226350a5760087585340115"; //원래라면 property나 appkey같은 내용을 한곳에서 관리하게끔 해야함
		
		ModelAndView mv = new ModelAndView("/market/findMarket");
		mv.addObject("mk_name",mk_name);
		mv.addObject("appkey",appkey);
		
		return mv;
	}

	
	@ResponseBody
	@RequestMapping(value= "/searchMarket.do", method = RequestMethod.GET)
	public List<FindMarketVO> searchMarketList(@RequestParam(value="searchKeyword") String searchKeyword) throws Exception{
		
		//System.out.println("searchMarket.do");
		SearchVO searchVO = new SearchVO();
		searchVO.setSearchKeyword(searchKeyword);
		List<FindMarketVO> resultList = findMarketService.selectMarketList(searchVO);
		return resultList;
	}
	
	@ResponseBody
	@RequestMapping(value="/choiceMarket.do", method = RequestMethod.GET)
	public FindMarketVO changeChoiceMarket(@RequestParam(value="searchKey") int searchKey, HttpServletRequest request ) throws Exception {
		
		//System.out.println("choiceMarket.do");
		UserVO userVO = (UserVO) request.getSession().getAttribute("loginInfo");
		Integer mk_number = findMarketService.selectUserChoiceMarket(userVO); 
		Map<String, Object> map = new HashMap<String, Object>();
		
		//System.out.println(userVO.getId());
		if(null == mk_number) {
			map.put("id", userVO.getId());
			map.put("mk_number", searchKey);
			findMarketService.insertUserChoiceMarket(map);
		}else {
			map.put("id", userVO.getId());
			map.put("mk_number", searchKey);
			findMarketService.updateUserChoiceMarket(map);
		}

		SearchVO searchVO = new SearchVO();
		searchVO.setSearchKey(searchKey);
		
		FindMarketVO fmv = new FindMarketVO();
		String mk_name = findMarketService.selectUserChoiceMarketName(searchVO);
		fmv.setMk_name(mk_name);

		return fmv;
	}
	
	@ResponseBody
	@RequestMapping(value="/detailMarket.do", method = RequestMethod.GET)
	public FindMarketVO getMarketInfo(@RequestParam(value="searchKey") int searchKey, HttpServletRequest request ) throws Exception {

		//System.out.println("detailMarket.do");
		UserVO userVO = (UserVO) request.getSession().getAttribute("loginInfo");
		
		SearchVO searchVO = new SearchVO();
		searchVO.setSearchKey(searchKey);
		FindMarketVO fmv = findMarketService.selectMarketInfo(searchVO);
		//System.out.println(fmv.getMk_name()+" "+fmv.getMk_intro());
		
		
		return fmv;
	}
}
