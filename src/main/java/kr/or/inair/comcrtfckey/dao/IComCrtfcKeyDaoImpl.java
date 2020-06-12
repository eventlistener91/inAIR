package kr.or.inair.comcrtfckey.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.Com_CrtfcKeyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IComCrtfcKeyDaoImpl implements IComCrtfcKeyDao{
	
	@Autowired
	private SqlMapClient client;

	@Override
	public List<Com_CrtfcKeyVO> getComCrtfcKey(Map<String, String> params)
			throws Exception {
		return client.queryForList("comCrtfcKey.getComCrtfcKey", params);
	}

	@Override
	public void deleteCrtfcKey(String corp_code) throws Exception {
		client.update("comCrtfcKey.deleteCrtfcKey", corp_code);
	}

	@Override
	public List<Com_CrtfcKeyVO> getComNameList(String corp_name) throws Exception {
		return client.queryForList("comCrtfcKey.getComNameList", corp_name);
	}
	
}
