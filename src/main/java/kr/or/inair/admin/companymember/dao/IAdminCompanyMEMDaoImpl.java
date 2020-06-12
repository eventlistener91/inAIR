package kr.or.inair.admin.companymember.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.CompanyMemVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IAdminCompanyMEMDaoImpl implements IAdminCompanyMEMDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public String getTotalCount(Map<String, String> params) throws Exception {
		return (String)client.queryForObject("companyMem.getTotalCount", params);
	}

	@Override
	public List<CompanyMemVO> getCompanyMemList(Map<String, String> params)
			throws Exception {
		return client.queryForList("companyMem.adminGetCompanyMemList", params);
	}

	@Override
	public String getDeleteCompanyMemberTotalCount(Map<String, String> params)
			throws Exception {
		return (String)client.queryForObject("companyMem.getDeleteCompanyMemberTotalCount", params);
	}

	@Override
	public List<CompanyMemVO> getDeleteCompanyMemList(Map<String, String> params)
			throws Exception {
		return client.queryForList("companyMem.adminGetDeleteCompanyMemList", params);
	}

	@Override
	public CompanyMemVO getCompanyMemberInfo(String com_id) throws Exception {
		return (CompanyMemVO)client.queryForObject("companyMem.adminGetCompanyMemberInfo", com_id);
	}
	
}