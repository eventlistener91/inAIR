package kr.or.inair.admin.individualmember.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.INDVDLMEMVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IAdminINDVDLMEMDaoImpl implements IAdminINDVDLMEMDao {
	@Autowired
	private SqlMapClient client;

	
	@Override
	public List<INDVDLMEMVO> getINDVDLMemList(Map<String, String> params)
			throws Exception {
		System.out.println("여기");
		return client.queryForList("indvdlmem.adminGetINDVDLMemList", params);
	}

	@Override
	public String getTotalCount(Map<String, String> params) throws Exception {
		return (String)client.queryForObject("indvdlmem.getTotalCount", params);
	}

	@Override
	public String getDeleteINDVDLMEMTotalCount(Map<String, String> params)
			throws Exception {
		return (String)client.queryForObject("indvdlmem.getDeleteINDVDLMEMTotalCount", params);
	}

	@Override
	public List<INDVDLMEMVO> getDelteINDVDLMemList(Map<String, String> params)
			throws Exception {
		return client.queryForList("indvdlmem.adminGetDeleteINDVDLMemList", params);
	}

	@Override
	public INDVDLMEMVO getINDVDLMEMInfo(String indvdl_id) throws Exception {
		return (INDVDLMEMVO)client.queryForObject("indvdlmem.adminGetINDVDLMEMInfo", indvdl_id);
	}

	
}
