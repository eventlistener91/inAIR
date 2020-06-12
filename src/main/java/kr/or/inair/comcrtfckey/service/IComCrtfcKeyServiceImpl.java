package kr.or.inair.comcrtfckey.service;

import java.util.List;
import java.util.Map;

import kr.or.inair.comcrtfckey.dao.IComCrtfcKeyDao;
import kr.or.inair.vo.Com_CrtfcKeyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class IComCrtfcKeyServiceImpl implements IComCrtfcKeyService{

	@Autowired
	private IComCrtfcKeyDao iComCrtfcKeyDao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<Com_CrtfcKeyVO> getComCrtfcKey(Map<String, String> params)
			throws Exception {
		return iComCrtfcKeyDao.getComCrtfcKey(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void deleteCrtfcKey(String corp_code) throws Exception {
		iComCrtfcKeyDao.deleteCrtfcKey(corp_code);
	}

	@Override
	public List<Com_CrtfcKeyVO> getComNameList(String corp_name) throws Exception {
		return iComCrtfcKeyDao.getComNameList(corp_name);
	}

}
