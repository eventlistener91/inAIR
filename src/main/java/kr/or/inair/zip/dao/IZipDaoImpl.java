package kr.or.inair.zip.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.ZipVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IZipDaoImpl implements IZipDao{
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<ZipVO> getZipList(Map<String, String> params) throws Exception {
		return client.queryForList("zip.getZipList", params);
	}

}
