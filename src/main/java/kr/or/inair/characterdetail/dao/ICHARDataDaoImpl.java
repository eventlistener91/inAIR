package kr.or.inair.characterdetail.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.CHAR_DETAVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICHARDataDaoImpl implements ICHARDataDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public CHAR_DETAVO charDetailInfo(Map<String, String> params) throws Exception {
		return (CHAR_DETAVO) client.queryForList("charDeta.selectCharDeta", params);
	}

	@Override
	public List<CHAR_DETAVO> getCharDetaList() throws Exception {
		return client.queryForList("charDeta.getCharDetaList");
	}

}
