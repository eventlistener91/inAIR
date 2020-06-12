package kr.or.inair.recentjo.service;

import java.util.List;
import java.util.Map;

import kr.or.inair.recentjo.dao.IRecentJODao;
import kr.or.inair.vo.Recent_JoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IRecentJOServiceImpl implements IRecentJOService {
	@Autowired
	private IRecentJODao recentJODao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void insertRecentJo(Map<String, String> params) throws Exception {
		recentJODao.insertRecentJo(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<Recent_JoVO> recentJoList(String indvdl_id) throws Exception {
		return recentJODao.recentJoList(indvdl_id);
	}

}
