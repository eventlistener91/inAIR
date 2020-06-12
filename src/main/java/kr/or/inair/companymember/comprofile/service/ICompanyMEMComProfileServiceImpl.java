package kr.or.inair.companymember.comprofile.service;
import kr.or.inair.companymember.comprofile.dao.ICompanyMEMComProfileDao;
import kr.or.inair.vo.COM_ProfileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ICompanyMEMComProfileServiceImpl implements ICompanyMEMComProfileService {
	@Autowired
	private ICompanyMEMComProfileDao comProfileDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public COM_ProfileVO getComProfileInfo(String com_id) throws Exception {
		return comProfileDao.getComProfileInfo(com_id);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void insertComProfileInfo(COM_ProfileVO comProfileInfo)
			throws Exception {
		comProfileDao.insertComProfileInfo(comProfileInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateComProfileInfo(COM_ProfileVO comProfileInfo)
			throws Exception {
		comProfileDao.updateComProfileInfo(comProfileInfo);
	}

}