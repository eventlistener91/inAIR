package kr.or.inair.companymember.companymember.dao;
import java.util.Map;

import kr.or.inair.vo.CompanyMemVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICompanyMEMDaoImpl implements ICompanyMEMDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public CompanyMemVO getComMemInfo(Map<String, String> params)
			throws Exception {
		return (CompanyMemVO) client.queryForObject("companyMem.getComMemInfo", params);
	}

	@Override
	public CompanyMemVO duplCheck(Map<String, String> params) throws Exception {
		return (CompanyMemVO) client.queryForObject("companyMem.duplCheck", params);
	}

	@Override
	public void insertCompanyMember(CompanyMemVO comMemberInfo)
			throws Exception {
		client.insert("companyMem.insertCompanyMember", comMemberInfo);
	}

	@Override
	public CompanyMemVO getMyPageCompanyMemberInfo(String com_id)
			throws Exception {
		return (CompanyMemVO)client.queryForObject("companyMem.getMyPageCompanyMemberInfo", com_id);
	}

	@Override
	public void updatecompanyMEMInfo(CompanyMemVO updateCompanyMemVo)
			throws Exception {
		client.update("companyMem.updatecompanyMEMInfo", updateCompanyMemVo);
	}

	@Override
	public void passwordChange(Map<String, String> params) throws Exception {
		client.update("companyMem.passwordChange", params);
	}

	@Override
	public void deleteComMem(Map<String, String> params) throws Exception {
		client.update("companyMem.deleteComMem", params);
	}

}