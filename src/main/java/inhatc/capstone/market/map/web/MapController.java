package inhatc.capstone.market.map.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import inhatc.capstone.market.common.SearchVO;
import inhatc.capstone.market.findMarket.FindMarketVO;
import inhatc.capstone.market.map.MapService;
import inhatc.capstone.market.map.MapVO;
import inhatc.capstone.market.user.UserVO;

@Controller
public class MapController {
	
	@Resource(name = "mapService")
	private MapService mapService;
	
	@ResponseBody
	@RequestMapping(value = "/map/selectMapInfo.do")
	public MapVO testKaKao(@RequestParam(value="mk_number") int mk_number, HttpServletRequest request) {
		MapVO mapInfo = new MapVO();
		mapInfo.setMk_number(mk_number);
		mapInfo = mapService.selectMapInfo(mapInfo);
		return mapInfo;
		
	}
	
}
