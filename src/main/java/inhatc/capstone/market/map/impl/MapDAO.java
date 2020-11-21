package inhatc.capstone.market.map.impl;

import org.springframework.stereotype.Repository;

import inhatc.capstone.market.common.impl.AbstractDAO;
import inhatc.capstone.market.map.MapVO;
import inhatc.capstone.market.user.UserVO;

@Repository("mapDAO")
public class MapDAO extends AbstractDAO{

	public MapVO selectMapInfo(MapVO mapInfo) {
		// TODO Auto-generated method stub
		return (MapVO) selectOne("mapDAO.selectMapInfo",mapInfo);
	}

	public void updateMapInfo(MapVO mapVO) {
		// TODO Auto-generated method stub
		update("mapDAO.updateMapInfo", mapVO);
	}

	public void insertMapInfo(MapVO mapVO) {
		// TODO Auto-generated method stub
		insert("mapDAO.insertMapInfo", mapVO);
	}

}
