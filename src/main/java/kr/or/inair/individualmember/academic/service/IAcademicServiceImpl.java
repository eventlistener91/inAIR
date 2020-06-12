package kr.or.inair.individualmember.academic.service;
import java.util.List;

import kr.or.inair.individualmember.academic.dao.IAcademicDao;
import kr.or.inair.vo.AcademicVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IAcademicServiceImpl implements IAcademicService {
	@Autowired
	private IAcademicDao academicDao;

	@Override
	public List<AcademicVO> getAcademicList() throws Exception {
		return academicDao.getAcademicList();
	}

	
}
