package kr.or.inair.company.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.CompanyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICompanyDaoImpl implements ICompanyDao{
	
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertCompany(Map<String, String> params) throws Exception {
		client.insert("company.insertCompany", params);
	}

	@Override
	public CompanyVO getCompanyInfo(String corp_code) throws Exception {
		return (CompanyVO) client.queryForObject("company.getCompanyInfo", corp_code);
	}

	@Override
	public void updateCompany(CompanyVO updateCompanyVo) throws Exception {
		client.update("company.updateCompany", updateCompanyVo);
	}

	@Override
	public List<CompanyVO> companyList(Map<String, String> params) throws Exception {
		return client.queryForList("company.companyList", params);
	}
	
}
