package kr.or.inair.individualmember.jobofferfile.service;

import java.util.List;

import kr.or.inair.individualmember.jobofferfile.dao.IJobOfferFileDao;
import kr.or.inair.vo.Job_Offer_FileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IJobOfferFileServiceImpl implements IJobOfferFileService {
	@Autowired
	private IJobOfferFileDao jobOfferFileDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void insertJobOfferFileList(
			List<Job_Offer_FileVO> insertJobOfferFileList) throws Exception {
		jobOfferFileDao.insertJobOfferFileList(insertJobOfferFileList);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<Job_Offer_FileVO> getJobOfferFileList(String jo_num)
			throws Exception {
		return jobOfferFileDao.getJobOfferFileList(jo_num);
	}

	
}
