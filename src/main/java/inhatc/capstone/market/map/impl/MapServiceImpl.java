package inhatc.capstone.market.map.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import inhatc.capstone.market.map.MapService;
import inhatc.capstone.market.map.MapVO;
import inhatc.capstone.market.user.UserVO;

@Service("mapService")
public class MapServiceImpl implements MapService{

	@Resource(name="mapDAO")
	private MapDAO mapDAO;
	
	@Override
	public MapVO selectMapInfo(MapVO mapInfo) {
		// TODO Auto-generated method stub
		return mapDAO.selectMapInfo(mapInfo);
	}

	@Override
	public void updateMapInfo(MapVO mapVO) {
		// TODO Auto-generated method stub
		mapDAO.updateMapInfo(mapVO);
	}

	@Override
	public void insertMapInfo(MapVO mapVO) {
		// TODO Auto-generated method stub
		mapDAO.insertMapInfo(mapVO);
	}

}
