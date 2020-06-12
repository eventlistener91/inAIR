package kr.or.inair.individualmember.uppro.dao;
import java.util.List;

import kr.or.inair.vo.UpProVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IUpPRODaoImpl implements IUpPRODao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<UpProVO> getUpPROList() throws Exception {
		return client.queryForList("uppro.getUpPROList");
	}
	
}
