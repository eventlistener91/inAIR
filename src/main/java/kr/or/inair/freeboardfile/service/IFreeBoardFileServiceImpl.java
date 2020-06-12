package kr.or.inair.freeboardfile.service;
import java.util.Map;

import kr.or.inair.freeboardfile.dao.IFreeBoardFileDao;
import kr.or.inair.vo.Freeboard_FileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IFreeBoardFileServiceImpl implements IFreeBoardFileService{
	@Autowired
	private IFreeBoardFileDao freeBoardFileDao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly= true)
	@Override
	public Freeboard_FileVO freefileItemInfo(Map<String, String> params)
			throws Exception {
		Freeboard_FileVO freefileItemInfo = null;
		freefileItemInfo = freeBoardFileDao.freefileItemInfo(params);
		return freefileItemInfo;
	}

}
