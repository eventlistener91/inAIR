package kr.or.inair.admin.itemmanagement.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.ClassOfPositionVO;
import kr.or.inair.vo.EmploymentVO;
import kr.or.inair.vo.INDVDL_DropVO;
import kr.or.inair.vo.LanguageVO;
import kr.or.inair.vo.LowIndustryVO;
import kr.or.inair.vo.LowProVO;
import kr.or.inair.vo.SalaryVO;
import kr.or.inair.vo.UpIndustryVO;
import kr.or.inair.vo.UpProVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
@Repository
public class ItemManagementDaoImpl implements ItemManagementDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<LanguageVO> adminLanguageList(Map<String, String> params) throws Exception {
		return client.queryForList("language.adminLanguageList",params);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("language.totalCount", params);
	}

	@Override
	public void insertLanguage(LanguageVO languageInfo) throws Exception {
		client.insert("language.insertLanguage", languageInfo);
		
	}

	@Override
	public void deleteLanguage(Map<String, String> params) throws Exception {
		client.update("language.deleteLanguage", params);
		
	}

	@Override
	public List<SalaryVO> salaryList(Map<String, String> params)
			throws Exception {
		return client.queryForList("salary.adminSalaryList", params);
	}

	@Override
	public String getAdminTotalCount() throws Exception {
		// TODO Auto-generated method stub
		return (String) client.queryForObject("salary.getAdminTotalCount");
	}

	@Override
	public void insertSalary(SalaryVO salaryInfo) throws Exception {
		client.insert("salary.insertSalary", salaryInfo);
		
	}

	@Override
	public void deleteSalary(Map<String, String> params) throws Exception {
		client.update("salary.deleteSalary", params);
		
	}

	@Override
	public List<ClassOfPositionVO> classOfPositionList(
			Map<String, String> params) throws Exception {
		return client.queryForList("classOfPosition.selectAllClsf", params);
	}

	@Override
	public String clsfTotal(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("classOfPosition.totalClsf", params);
	}

	@Override
	public void insertClsf(ClassOfPositionVO clsfInfo) throws Exception {
		client.insert("classOfPosition.insertClsf", clsfInfo);
		
	}

	@Override
	public void deleteClsf(Map<String, String> params) throws Exception {
		client.update("classOfPosition.deleteClsf", params);
		
	}

	@Override
	public List<UpProVO> UpProList(Map<String, String> params) throws Exception {
		
		return client.queryForList("uppro.selectAllPROList", params);
	}

	@Override
	public String totalUpPRO(Map<String, String> params) throws Exception {
		
		return (String) client.queryForObject("uppro.totalUpPRO", params);
		
		
	}

	@Override
	public void insertUpPRO(UpProVO upProInfo) throws Exception {
		client.insert("uppro.insertUpPRO", upProInfo);
		
	}

	@Override
	public void deleteUpPRO(Map<String, String> params) throws Exception {
		client.update("uppro.deleteUpPRO", params);
		
	}

	@Override
	public List<LowProVO> AdminlowPROList(Map<String, String> params)
			throws Exception {
		return client.queryForList("lowpro.adminLowProList",params);
	}

	@Override
	public void insertLowPRO(LowProVO lowProInfo) throws Exception {
		client.insert("lowpro.insertAdminLowPro", lowProInfo);
		
	}

	@Override
	public void deleteLowPRO(Map<String, String> params) throws Exception {
		client.update("lowpro.deleteAdminLowPro", params);
		
	}

	@Override
	public List<UpIndustryVO> UpIndustryList(Map<String, String> params)
			throws Exception {
	
		return client.queryForList("upindustry.selectAllUpINDUTYList", params);
	}

	@Override
	public String totalUpIndustry(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("upindustry.totalUpINDUTY", params);
	}

	@Override
	public void insertUpIndustry(UpIndustryVO upIndustryInfo) throws Exception {
		client.insert("upindustry.insertUpINDUTY", upIndustryInfo);
	}

	@Override
	public void deleteUpIndustry(Map<String, String> params) throws Exception {
		client.update("upindustry.deleteUpINDUTY", params);
	}

	@Override
	public List<LowIndustryVO> AdminLowIndustryList(Map<String, String> params)
			throws Exception {
		
		return client.queryForList("lowIndustry.adminLowIndustryList", params);
	}

	@Override
	public void insertLowIndustry(LowIndustryVO lowIndustryInfo)
			throws Exception {
		client.insert("lowIndustry.insertLowIndustry", lowIndustryInfo);
		
	}

	@Override
	public void deleteLowIndustry(Map<String, String> params) throws Exception {
		client.update("lowIndustry.deleteLowIndustry", params);
		
	}
	@Override
	public List<INDVDL_DropVO> IndvdlDropList(Map<String, String> params)
			throws Exception {
		return client.queryForList("indvdlDrop.adminIndvdlDropList", params);
	}
	@Override
	public String indvdlDropTotalCount(Map<String, String> params)
			throws Exception {
		return (String) client.queryForObject("indvdlDrop.indvdlDropTotalCount", params);
	}
	@Override
	public void insertIndvdlDrop(INDVDL_DropVO IndvdlDropInfo) throws Exception {
		client.insert("indvdlDrop.insertIndvdlDrop", IndvdlDropInfo);
		
	}
	@Override
	public void deleteIndvdlDrop(Map<String, String> params) throws Exception {
		client.delete("indvdlDrop.deleteSalary", params);
	}

	@Override
	public List<EmploymentVO> adminEmploymentList(Map<String, String> params)
			throws Exception {
		return client.queryForList("employment.adminEmploymentList", params);
	}

	@Override
	public String adminEmployTotalCount() throws Exception {
		// TODO Auto-generated method stub
		return (String) client.queryForObject("employment.adminEmployTotalCount");
	}

	@Override
	public void insertEmploy(EmploymentVO employmentInfo) throws Exception {
		client.insert("employment.insertEmploy", employmentInfo);
		
	}

	@Override
	public void deleteEmploy(Map<String, String> params) throws Exception {
		client.update("employment.deleteEmploy",params);
		
	}
}
