package kr.or.inair.admin.language.service;
import java.util.List;
import java.util.Map;

import kr.or.inair.admin.language.dao.IAdminLanguageDao;
import kr.or.inair.vo.LanguageVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IAdminLanguageServiceImpl implements IAdminLanguageService {
	@Autowired
	private IAdminLanguageDao languadeDao;

//	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
//	@Override
//	public List<LanguageVO> adminLanguageList(Map<String, String> params) throws Exception {
//		List<LanguageVO> adminLanguageList = null;
//		adminLanguageList = languadeDao.adminLanguageList(params);
//		return adminLanguageList;
//	}
//
//	@Override
//	public String totalCount(Map<String, String> params) throws Exception {
//		String totalCount = "0";
//		totalCount = languadeDao.totalCount(params);
//		return totalCount;
//	}

}
