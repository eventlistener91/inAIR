package kr.or.inair.individualmember.lowindustry.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.LowIndustryVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ILowIndustryDaoImpl implements ILowIndustryDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<LowIndustryVO> getLowIndustryList(Map<String, String> params)
			throws Exception {
		return client.queryForList("lowIndustry.getLowIndustryList", params);
	}

	@Override
	public LowIndustryVO getIndustryInfo(String lwinduty_num) throws Exception {
		return (LowIndustryVO)client.queryForObject("lowIndustry.getIndustryInfo", lwinduty_num);
	}

	@Override
	public List<LowIndustryVO> getLowIndustry() throws Exception {
		return client.queryForList("lowIndustry.getLowIndustry");
	}

	
}
