package kr.or.inair.admin.itemmanagement.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.inair.admin.itemmanagement.dao.ItemManagementDao;
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
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
@Service
public class ItemManagementServiceImpl implements ItemManagementService {
	@Autowired
	private ItemManagementDao itemManagementDao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<LanguageVO> adminLanguageList(Map<String, String> params) throws Exception {
		List<LanguageVO> adminLanguageList = null;
		adminLanguageList = itemManagementDao.adminLanguageList(params);
		return adminLanguageList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		String totalCount = "0";
		totalCount = itemManagementDao.totalCount(params);
		return totalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertLanguage(LanguageVO languageInfo) throws Exception {
		try {
			itemManagementDao.insertLanguage(languageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void deleteLanguage(Map<String, String> params) throws Exception {
		try {
			itemManagementDao.deleteLanguage(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<SalaryVO> salaryList(Map<String, String> params)
			throws Exception {
		List<SalaryVO> salaryList =null;
		salaryList = itemManagementDao.salaryList(params);
		return salaryList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String getAdminTotalCount() throws Exception {
		String adminTotalCount ="0";
		adminTotalCount = itemManagementDao.getAdminTotalCount();
		return adminTotalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertSalary(SalaryVO salaryInfo) throws Exception {
		try {
			itemManagementDao.insertSalary(salaryInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void deleteSalary(Map<String, String> params) throws Exception {
		try {
			itemManagementDao.deleteSalary(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<ClassOfPositionVO> classOfPositionList(
			Map<String, String> params) throws Exception {
		List<ClassOfPositionVO> classOfPositionList = null;
		classOfPositionList=itemManagementDao.classOfPositionList(params);
		return classOfPositionList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String clsfTotal(Map<String, String> params) throws Exception {
		String clsfTotal = "0";
		clsfTotal = itemManagementDao.clsfTotal(params);
		return clsfTotal;
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertClsf(ClassOfPositionVO clsfInfo) throws Exception {
		try {
			itemManagementDao.insertClsf(clsfInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void deleteClsf(Map<String, String> params) throws Exception {
		try {
			itemManagementDao.deleteClsf(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<UpProVO> UpProList(Map<String, String> params) throws Exception {
		List<UpProVO> upProList = null;
		upProList = itemManagementDao.UpProList(params);
		return upProList;
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String totalUpPRO(Map<String, String> params) throws Exception {
		String totalUpPro ="0";
		totalUpPro = itemManagementDao.totalUpPRO(params);
		return totalUpPro;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertUpPRO(UpProVO upProInfo) throws Exception {
		try {
			itemManagementDao.insertUpPRO(upProInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void deleteUpPRO(Map<String, String> params) throws Exception {
		try {
			itemManagementDao.deleteUpPRO(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<LowProVO> AdminlowPROList(Map<String, String> params)
			throws Exception {
		List<LowProVO> lowProList = null;
		lowProList = itemManagementDao.AdminlowPROList(params);	
		return lowProList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertLowPRO(LowProVO lowProInfo) throws Exception {
		try {
			itemManagementDao.insertLowPRO(lowProInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void deleteLowPRO(Map<String, String> params) throws Exception {
		try {
			itemManagementDao.deleteLowPRO(params);	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<UpIndustryVO> UpIndustryList(Map<String, String> params)
			throws Exception {
		List<UpIndustryVO> upIndustryList = null;
		upIndustryList = itemManagementDao.UpIndustryList(params);
		return upIndustryList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String totalUpIndustry(Map<String, String> params) throws Exception {
		String totalUpIndustry ="0";
		totalUpIndustry = itemManagementDao.totalUpIndustry(params);
		return totalUpIndustry;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertUpIndustry(UpIndustryVO upIndustryInfo) throws Exception {
		try {
			itemManagementDao.insertUpIndustry(upIndustryInfo);	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void deleteUpIndustry(Map<String, String> params) throws Exception {
		try {
			itemManagementDao.deleteUpIndustry(params);	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<LowIndustryVO> AdminLowIndustryList(Map<String, String> params)
			throws Exception {
		List<LowIndustryVO> lowIndustryList = null;
		lowIndustryList = itemManagementDao.AdminLowIndustryList(params);
		return lowIndustryList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertLowIndustry(LowIndustryVO lowIndustryInfo)
			throws Exception {
	
			itemManagementDao.insertLowIndustry(lowIndustryInfo);
	
		
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void deleteLowIndustry(Map<String, String> params) throws Exception {
	
		itemManagementDao.deleteLowIndustry(params);
		
		
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<INDVDL_DropVO> IndvdlDropList(Map<String, String> params)
			throws Exception {
		List<INDVDL_DropVO> indvdlDropList = null;
		indvdlDropList = itemManagementDao.IndvdlDropList(params);
		return indvdlDropList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String indvdlDropTotalCount(Map<String, String> params)
			throws Exception {
		String indvdlDropTotalCount ="0";
		indvdlDropTotalCount = itemManagementDao.indvdlDropTotalCount(params);
		return indvdlDropTotalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertIndvdlDrop(INDVDL_DropVO IndvdlDropInfo) throws Exception {
		itemManagementDao.insertIndvdlDrop(IndvdlDropInfo);
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void deleteIndvdlDrop(Map<String, String> params) throws Exception {
		itemManagementDao.deleteIndvdlDrop(params);
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<EmploymentVO> adminEmploymentList(Map<String, String> params)
			throws Exception {
		List<EmploymentVO> adminEmploymentList =null;
		adminEmploymentList = itemManagementDao.adminEmploymentList(params);
		return adminEmploymentList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String adminEmployTotalCount() throws Exception {
		String adminEmployTotalCount = "0";
		adminEmployTotalCount = itemManagementDao.adminEmployTotalCount();
		return adminEmployTotalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertEmploy(EmploymentVO employmentInfo) throws Exception {
		itemManagementDao.insertEmploy(employmentInfo);
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void deleteEmploy(Map<String, String> params) throws Exception {
		itemManagementDao.deleteEmploy(params);
	}
	
	
	

	
	
	
}
