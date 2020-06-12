package kr.or.inair.individualmember.finalacademic.service;
import java.util.List;

import kr.or.inair.individualmember.finalacademic.dao.IFinalAcademicDao;
import kr.or.inair.vo.Final_AcademicVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IFinalAcademicServiceImpl implements IFinalAcademicService {
	@Autowired
	private IFinalAcademicDao finalAcademicDao;

	@Transactional( propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<Final_AcademicVO> getFinalAcademicList() throws Exception {
		return finalAcademicDao.getFinalAcademicList();
	}

	@Override
	public List<Final_AcademicVO> getJobOfferFinalAcademicList()
			throws Exception {
		return finalAcademicDao.getJobOfferFinalAcademicList();
	}

}
