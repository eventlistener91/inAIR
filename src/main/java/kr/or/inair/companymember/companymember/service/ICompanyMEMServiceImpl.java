package kr.or.inair.companymember.companymember.service;

import java.util.Map;

import kr.or.inair.companymember.companymember.dao.ICompanyMEMDao;
import kr.or.inair.vo.CompanyMemVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ICompanyMEMServiceImpl implements ICompanyMEMService {
	@Autowired
	private ICompanyMEMDao companyMemberDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public CompanyMemVO getComMemInfo(Map<String, String> params)
			throws Exception {
		return companyMemberDao.getComMemInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public CompanyMemVO duplCheck(Map<String, String> params) throws Exception {
		return companyMemberDao.duplCheck(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void insertCompanyMember(CompanyMemVO comMemberInfo)
			throws Exception {
		companyMemberDao.insertCompanyMember(comMemberInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public CompanyMemVO getMyPageCompanyMemberInfo(String com_id)
			throws Exception {
		return companyMemberDao.getMyPageCompanyMemberInfo(com_id);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updatecompanyMEMInfo(CompanyMemVO updateCompanyMemVo)
			throws Exception {
		companyMemberDao.updatecompanyMEMInfo(updateCompanyMemVo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void passwordChange(Map<String, String> params) throws Exception {
		companyMemberDao.passwordChange(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void deleteComMem(Map<String, String> params) throws Exception {
		companyMemberDao.deleteComMem(params);
	}
	
}