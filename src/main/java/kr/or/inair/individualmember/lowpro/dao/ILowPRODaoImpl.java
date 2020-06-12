package kr.or.inair.individualmember.lowpro.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.LowProVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ILowPRODaoImpl implements ILowPRODao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<LowProVO> getLowPROList(Map<String, String> params)
			throws Exception {
		return client.queryForList("lowpro.getLowPROList", params);
	}

	@Override
	public List<LowProVO> getLowProfession() throws Exception {
		return client.queryForList("lowpro.gowLowProfession");
	}

	
}
