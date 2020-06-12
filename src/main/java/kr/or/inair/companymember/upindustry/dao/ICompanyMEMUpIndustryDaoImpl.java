package kr.or.inair.companymember.upindustry.dao;
import java.util.List;

import kr.or.inair.vo.UpIndustryVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICompanyMEMUpIndustryDaoImpl implements ICompanyMEMUpIndustryDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<UpIndustryVO> getUpIndutyList() throws Exception {
		return client.queryForList("upindustry.getUpIndustryList");
	}

}
