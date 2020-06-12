package kr.or.inair.mentorfile.service;
import java.util.Map;

import kr.or.inair.mentorfile.dao.IMentorFileDao;
import kr.or.inair.vo.Mentor_FileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IMentorFileServiceImpl implements IMentorFileService {
	@Autowired
	private IMentorFileDao memtorFileDao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly= true)
	@Override
	public Mentor_FileVO mentorfileItemInfo(Map<String, String> params)
			throws Exception {
		Mentor_FileVO mentorItemInfo = null;
		mentorItemInfo = memtorFileDao.mentorfileItemInfo(params);
		return mentorItemInfo;
	}

}
