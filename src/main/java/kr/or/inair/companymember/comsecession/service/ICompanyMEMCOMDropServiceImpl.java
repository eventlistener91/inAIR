package kr.or.inair.companymember.comsecession.service;
import java.util.List;

import kr.or.inair.companymember.comsecession.dao.ICompanyMEMCOMDropDao;
import kr.or.inair.vo.COM_DropVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ICompanyMEMCOMDropServiceImpl implements ICompanyMEMCOMDropService {
	@Autowired
	private ICompanyMEMCOMDropDao comMemDropDao;

	@Override
	public List<COM_DropVO> getDropOutList() throws Exception {
		return comMemDropDao.getDropOutList();
	}

	
}