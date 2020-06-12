package kr.or.inair.companyinfo.service;

import java.util.List;
import java.util.Map;

import kr.or.inair.companyinfo.dao.ICompanyInfoDao;
import kr.or.inair.vo.CompanyInfoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ICompanyInfoServiceImpl implements ICompanyInfoService{

	@Autowired
	private ICompanyInfoDao companyInfoDao;
	
	@Override
	public void insertCompanyInfo(Map<String, String> params) throws Exception {
		companyInfoDao.insertCompanyInfo(params);
	}

	@Override
	public List<CompanyInfoVO> getCompanyInfo(String corp_code)
			throws Exception {
		return companyInfoDao.getCompanyInfo(corp_code);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void insertCompanyInfoByVO(CompanyInfoVO comInfo) throws Exception {
		companyInfoDao.insertCompanyInfoByVO(comInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateCompanyInfoList(List<CompanyInfoVO> updateCompanyInfoList)
			throws Exception {
		companyInfoDao.updateCompanyInfoList(updateCompanyInfoList);
	}
	
}
