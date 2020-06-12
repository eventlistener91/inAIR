package kr.or.inair.individualmember.individualmember.dao;
import java.util.Map;

import kr.or.inair.vo.INDVDLMEMVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IINDVDLMEMDaoImpl implements IINDVDLMEMDao {
	@Autowired
	private SqlMapClient client;

	public INDVDLMEMVO indvdlmemInfo(Map<String, String> params)
			throws Exception {
		return (INDVDLMEMVO) client.queryForObject("indvdlmem.indvdlmemInfo", params);
	}

	@Override
	public INDVDLMEMVO searchid(Map<String, String> params) 
			throws Exception {
		return (INDVDLMEMVO) client.queryForObject("indvdlmem.searchid", params);
	}

	@Override
	public INDVDLMEMVO searchpass(Map<String, String> param) throws Exception {
		return (INDVDLMEMVO) client.queryForObject("indvdlmem.searchpass", param);
	}

	@Override
	public void updatePassword(Map<String, String> params) throws Exception {
		client.update("indvdlmem.updatePassword", params);
	}

	@Override
	public void insertIndvdlMember(INDVDLMEMVO indvdlMemInfo)
			throws Exception {
		client.insert("indvdlmem.insertIndvdlMember", indvdlMemInfo);
	}

	@Override
	public INDVDLMEMVO duplCheck(Map<String, String> params) throws Exception {
		return (INDVDLMEMVO) client.queryForObject("indvdlmem.duplCheck", params);
	}

	@Override
	public int getIndvdlMemCount() throws Exception {
		return (int) client.queryForObject("indvdlmem.getIndvdlMemCount");
	}
	@Override
	public void updateIndvdlMember(INDVDLMEMVO indvdlMemInfo) throws Exception {
		client.update("indvdlmem.updateIndivdualMember", indvdlMemInfo);
	}

	@Override
	public INDVDLMEMVO indvdlInfo(Map<String, String> params) throws Exception {
		return (INDVDLMEMVO) client.queryForObject("indvdlmem.indivdlInfo", params);
	}

	@Override
	public void passwordChange(Map<String, String> params) throws Exception {
		client.update("indvdlmem.passwordChange", params);
	}

	@Override
	public void deleteIndvdlMember(Map<String, String> params) throws Exception {
		client.update("indvdlmem.deleteIndvdlMem", params);
		
	}

	@Override
	public INDVDLMEMVO getLoginINDVDLMEMInfo(String indvdl_id) throws Exception {
		return (INDVDLMEMVO)client.queryForObject("indvdlmem.getLoginINDVDLMEMInfo", indvdl_id);
	}

	
}
