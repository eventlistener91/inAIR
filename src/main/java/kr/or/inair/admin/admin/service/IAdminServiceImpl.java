package kr.or.inair.admin.admin.service;

import kr.or.inair.admin.admin.dao.IAdminDao;
import kr.or.inair.vo.AdminVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IAdminServiceImpl implements IAdminService {
	@Autowired
	private IAdminDao adminDao;

	@Override
	public boolean getAdminInfo(AdminVO adminInfo) throws Exception {
		return adminDao.getAdminInfo(adminInfo);
	}
	
}
