package kr.or.inair.company.servie;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.inair.company.dao.ICompanyDao;
import kr.or.inair.vo.CompanyVO;

@Service
public class ICompanyServiceImpl implements ICompanyService{

	@Autowired
	private ICompanyDao companyDao;
	
	@Override
	public void insertCompany(Map<String, String> params) throws Exception {
		companyDao.insertCompany(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public CompanyVO getCompanyInfo(String corp_code) throws Exception {
		return companyDao.getCompanyInfo(corp_code);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateCompany(CompanyVO updateCompanyVo) throws Exception {
		companyDao.updateCompany(updateCompanyVo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<CompanyVO> companyList(Map<String, String> params) throws Exception {
		return companyDao.companyList(params);
	}
	
}
