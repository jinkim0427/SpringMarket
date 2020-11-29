package inhatc.capstone.market.map;

import inhatc.capstone.market.user.UserVO;

public interface MapService {

	MapVO selectMapInfo(MapVO mapInfo);

	void updateMapInfo(MapVO mapVO);

	void insertMapInfo(MapVO mapVO);
	
}
