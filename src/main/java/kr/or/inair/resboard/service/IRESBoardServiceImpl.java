package kr.or.inair.resboard.service;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.inair.resboard.dao.IRESBoardDao;
import kr.or.inair.resboardfile.dao.IRESBoardFileDao;
import kr.or.inair.utiles.AttachFileMapper;
import kr.or.inair.vo.ResboardVO;
import kr.or.inair.vo.Resboard_FileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class IRESBoardServiceImpl implements IRESBoardService {
	@Autowired
	private IRESBoardDao referenceDao;
	@Autowired
	private IRESBoardFileDao iresboardFileDao;
	@Autowired
	private AttachFileMapper resmapper;

	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<ResboardVO> resboardList(Map<String, String> params)
			throws Exception {
		List<ResboardVO> resboardList = null;
		resboardList = referenceDao.resboardList(params);
		return resboardList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		String totalCount = "0";
		totalCount = referenceDao.totalCount(params);
		return totalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public ResboardVO resboardInfo(Map<String, String> params) throws Exception {
		ResboardVO resboardInfo = null;
		resboardInfo = referenceDao.resboardInfo(params);
		return resboardInfo;
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void updateResboard(ResboardVO resboardInfo) throws Exception {
		try {
			referenceDao.updateResboard(resboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void deleteResboard(Map<String, String> params) throws Exception {
		try {
			referenceDao.deleteResboard(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertResboardInfo(ResboardVO resboardInfo,
									MultipartFile[] items) throws Exception {
		String res_num = referenceDao.insertResboardInfo(resboardInfo);
		
		List<Resboard_FileVO> resfileItemList = this.resmapper.resmapper(items, res_num);
		iresboardFileDao.insertFileItem(resfileItemList);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<ResboardVO> resCommentList(Map<String, String> params)
			throws Exception {
		List<ResboardVO> resboardList =null;
		resboardList = referenceDao.resCommentList(params);
		return resboardList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public void insertResboardReply(ResboardVO resboardInfo) throws Exception {
		try {
			referenceDao.insertResboardReply(resboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void updateCommentResboard(ResboardVO resboardInfo) throws Exception {
		try {
			referenceDao.updateCommentResboard(resboardInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
