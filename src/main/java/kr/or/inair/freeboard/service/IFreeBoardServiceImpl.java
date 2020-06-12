package kr.or.inair.freeboard.service;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.inair.freeboard.dao.IFreeBoardDao;
import kr.or.inair.freeboardfile.dao.IFreeBoardFileDao;
import kr.or.inair.utiles.AttachFileMapper;
import kr.or.inair.vo.FreeboardVO;
import kr.or.inair.vo.Freeboard_FileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class IFreeBoardServiceImpl implements IFreeBoardService {
	@Autowired
	private IFreeBoardDao freeboardDao;
	@Autowired
	private IFreeBoardFileDao freeboardFileDao;
	@Autowired
	private AttachFileMapper freeFilemMapper;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<FreeboardVO> freeboardList(Map<String, String> params)
			throws Exception {
		List<FreeboardVO> freeboardList = null;
		freeboardList = freeboardDao.freeboardList(params);
		
		return freeboardList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<FreeboardVO> freeboardComment(Map<String, String> commentparams)
			throws Exception {
		List<FreeboardVO> freeboardComList = null;
		freeboardComList = freeboardDao.freeboardComment(commentparams);
		return freeboardComList;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		String totalCount ="0";
		totalCount = freeboardDao.totalCount(params);
		return totalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public FreeboardVO freeboardInfo(Map<String, String> params)
			throws Exception {
		FreeboardVO freeboardInfo = null;
		
		freeboardInfo = freeboardDao.freeboardInfo(params);
		return freeboardInfo;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void updateFreeboardInfo(FreeboardVO freeboardInfo)
			throws Exception {
		try {
			freeboardDao.updateFreeboardInfo(freeboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void updateComment(FreeboardVO freeboardInfo) throws Exception {
		try {
			freeboardDao.updateComment(freeboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void deleteFreeboardInfo(Map<String, String> params)
			throws Exception {
		freeboardDao.deleteFreeboardInfo(params);
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertFreeboardInfo(FreeboardVO freeboardInfo,MultipartFile[] items)
			throws Exception {
		String freeboard_num = freeboardDao.insertFreeboardInfo(freeboardInfo);
		
		List<Freeboard_FileVO> freefileItemList = this.freeFilemMapper.freemapper(items, freeboard_num);
		freeboardFileDao.insertFileItem(freefileItemList);
	}
	

	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertFreeboardReply(FreeboardVO freeboardInfo)
			throws Exception {
		try {
			freeboardDao.insertFreeboardReply(freeboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}


}
