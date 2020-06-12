package kr.or.inair.mentor.service;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.inair.mentor.dao.IMentorDao;
import kr.or.inair.mentorfile.dao.IMentorFileDao;
import kr.or.inair.utiles.AttachFileMapper;
import kr.or.inair.vo.FreeboardVO;
import kr.or.inair.vo.MentorLowproVO;
import kr.or.inair.vo.MentorVO;
import kr.or.inair.vo.Mentor_FileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class IMentorServiceImpl implements IMentorService {
	@Autowired
	private IMentorDao memtorDao;
	@Autowired
	private IMentorFileDao mentorFileDao;
	@Autowired
	private AttachFileMapper mentorFileMapper;

	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<MentorVO> mentorList(Map<String, String> params)
			throws Exception {
		List<MentorVO> mentorList = null;
		mentorList = memtorDao.mentorList(params);
		
		return mentorList;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		String totalCount = "0";
		totalCount = memtorDao.totalCount(params);
		return totalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public String totalComment(Map<String, String> params) throws Exception {
		String totalComment ="0";
		totalComment = memtorDao.totalComment(params);
		return totalComment;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public MentorVO mentorboardInfo(Map<String, String> params)
			throws Exception {
		MentorVO mentorboardInfo = null;
		mentorboardInfo = memtorDao.mentorboardInfo(params);
		return mentorboardInfo;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void updateMentorboard(MentorVO mentorboardInfo) throws Exception {
		try {
			memtorDao.updateMentorboard(mentorboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void deleteMentorboard(Map<String, String> params) throws Exception {
		try {
			memtorDao.deleteMentorboard(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertMentorboard(MentorVO mentorboardInfo,MultipartFile[] items)
			throws Exception {
		String mentor_num = memtorDao.insertMentorboard(mentorboardInfo);
		
		List<Mentor_FileVO> mentorFileList = this.mentorFileMapper.mentormapper(items, mentor_num);
		mentorFileDao.insertFileItem(mentorFileList);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<MentorVO> mentorComment(Map<String, String> commentParams)
			throws Exception {
		List<MentorVO> mentorCommentList = null;
		mentorCommentList = memtorDao.mentorComment(commentParams);
		return mentorCommentList;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertMentorReply(MentorVO mentorboardInfo)
			throws Exception {
		try {
			memtorDao.insertMentorReply(mentorboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<MentorLowproVO> mentorLowproList(Map<String, String> params)
			throws Exception {
		List<MentorLowproVO> mentorLowproList = null;
		mentorLowproList = memtorDao.mentorLowproList(params);
		return mentorLowproList;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void updateComment(MentorVO mentorboardInfo) throws Exception {
		try {
			memtorDao.updateComment(mentorboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=true)
	@Override
	public List<MentorVO> mentorPopularity() throws Exception {
		List<MentorVO> mentorList = null;
		mentorList = memtorDao.mentorPopularity();
		
		return mentorList;
	}
	
	
	

}
