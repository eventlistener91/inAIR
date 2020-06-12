package kr.or.inair.admin.companymember.service;

import java.util.List;
import java.util.Map;

import kr.or.inair.admin.companymember.dao.IAdminCompanyMEMDao;
import kr.or.inair.vo.CompanyMemVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IAdminCompanyMEMServiceImpl implements IAdminCompanyMEMService {
	@Autowired
	private IAdminCompanyMEMDao companyMemberDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public String getTotalCount(Map<String, String> params) throws Exception {
		return companyMemberDao.getTotalCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<CompanyMemVO> getCompanyMemList(Map<String, String> params)
			throws Exception {
		return companyMemberDao.getCompanyMemList(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public String getDeleteCompanyMemberTotalCount(Map<String, String> params)
			throws Exception {
		return companyMemberDao.getDeleteCompanyMemberTotalCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<CompanyMemVO> getDeleteCompanyMemList(Map<String, String> params)
			throws Exception {
		return companyMemberDao.getDeleteCompanyMemList(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public CompanyMemVO getCompanyMemberInfo(String com_id) throws Exception {
		return companyMemberDao.getCompanyMemberInfo(com_id);
	}
	
}