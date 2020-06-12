package kr.or.inair.recentjo.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.Recent_JoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IRecentJODaoImpl implements IRecentJODao {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertRecentJo(Map<String, String> params) throws Exception {
		client.insert("recent_jo.insertRecentJo", params);
	}

	@Override
	public List<Recent_JoVO> recentJoList(String indvdl_id) throws Exception {
		return client.queryForList("recent_jo.selectRecentJo", indvdl_id);
	}

}
