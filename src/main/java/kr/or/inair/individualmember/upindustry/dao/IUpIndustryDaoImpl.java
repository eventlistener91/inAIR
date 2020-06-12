package kr.or.inair.individualmember.upindustry.dao;
import java.util.List;

import kr.or.inair.vo.UpIndustryVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IUpIndustryDaoImpl implements IUpIndustryDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<UpIndustryVO> getUpIndustryList() throws Exception {
		return client.queryForList("upindustry.getUpIndustryList");
	}

}
