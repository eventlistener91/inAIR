package kr.or.inair.notice.service;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.inair.notice.dao.INoticeDao;
import kr.or.inair.vo.NoticeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class INoticeServiceImpl implements INoticeService {
	@Autowired
	private INoticeDao noticeDao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<NoticeVO> noticeList(Map<String, String> params)
			throws Exception {
		List<NoticeVO> noticeList = null;
		noticeList = noticeDao.noticeList(params);
		return noticeList;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		String totalCount = "0";
		totalCount = noticeDao.totalCount(params);
		return totalCount;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<NoticeVO> indvdlNoticeList(Map<String, String> params)
			throws Exception {
		List<NoticeVO> indvdlNoticeList = null;
		indvdlNoticeList = noticeDao.indvdlNoticeList(params);
		return indvdlNoticeList;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String indvdlCount(Map<String, String> params) throws Exception {
		String indvdlCount = "0";
		indvdlCount = noticeDao.indvdlCount(params);
		return indvdlCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<NoticeVO> COMNoticeList(Map<String, String> params)
			throws Exception {
		List<NoticeVO> COMNoticeList = null;
		COMNoticeList = noticeDao.COMNoticeList(params);
		return COMNoticeList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String COMNoticeCount(Map<String, String> params) throws Exception {
		String COMNoticeCount = "0";
		COMNoticeCount = noticeDao.COMNoticeCount(params);
		return COMNoticeCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public NoticeVO noticeInfo(Map<String, String> params) throws Exception {
		NoticeVO noticeInfo = null;
		noticeInfo = noticeDao.noticeInfo(params);
		return noticeInfo;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<NoticeVO> noticeboardList(Map<String, String> params)
			throws Exception {
		List<NoticeVO> noticeboardList = null;
		noticeboardList =noticeDao.noticeboardList(params); 
		return noticeboardList;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String totalNoticeCount(Map<String, String> params) throws Exception {
		String totalNoticeCount ="0";
		totalNoticeCount =noticeDao.totalNoticeCount(params);
		return totalNoticeCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertNoticeInfo(NoticeVO noticeboardInfo) throws Exception {
		try {
			noticeDao.insertNoticeInfo(noticeboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}	

	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void updateNoticeInfo(NoticeVO noticeboardInfo) throws Exception {
		try {
			noticeDao.updateNoticeInfo(noticeboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void deleteNotice(Map<String, String> params) throws Exception {
		try {
			noticeDao.deleteNotice(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
