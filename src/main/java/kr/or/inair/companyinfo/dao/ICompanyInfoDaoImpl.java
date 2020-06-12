package kr.or.inair.companyinfo.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.CompanyInfoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICompanyInfoDaoImpl implements ICompanyInfoDao{

	@Autowired
	private SqlMapClient client;
	
	@Override
	public void insertCompanyInfo(Map<String, String> params) throws Exception {
		client.insert("companyInfo.insertCompanyInfo", params);
	}

	@Override
	public List<CompanyInfoVO> getCompanyInfo(String corp_code)
			throws Exception {
		return client.queryForList("companyInfo.getCompanyInfo", corp_code);
	}

	@Override
	public void insertCompanyInfoByVO(CompanyInfoVO comInfo) throws Exception {
		client.insert("companyInfo.insertCompanyInfoByVO", comInfo);
	}

	@Override
	public void updateCompanyInfoList(List<CompanyInfoVO> updateCompanyInfoList)
			throws Exception {
		for(CompanyInfoVO updateCompanyInfo : updateCompanyInfoList){
			client.update("companyInfo.updateCompanyInfo", updateCompanyInfo);
		}
	}
	
}
