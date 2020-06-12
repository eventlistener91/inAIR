package kr.or.inair.resboardfile.service;
import java.sql.SQLException;
import java.util.Map;

import kr.or.inair.resboardfile.dao.IRESBoardFileDao;
import kr.or.inair.vo.Resboard_FileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IRESBoardFileServiceImpl implements IRESBoardFileService {
	@Autowired
	private IRESBoardFileDao referenceFileDao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public Resboard_FileVO resboardfileItemInfo(Map<String, String> param)
			throws Exception {
		Resboard_FileVO resboardFileInfo = null;
		resboardFileInfo = referenceFileDao.resboardfileItemInfo(param);
		return resboardFileInfo;
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void updateFileitem(Resboard_FileVO resFileInfo) throws Exception {
		 try {
			 referenceFileDao.updateFileitem(resFileInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
