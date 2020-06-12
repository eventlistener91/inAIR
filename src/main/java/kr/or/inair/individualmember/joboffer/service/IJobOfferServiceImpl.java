package kr.or.inair.individualmember.joboffer.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.or.inair.companymember.recruitmentfield.dao.IRecruitmentFieldDao;
import kr.or.inair.companymember.recruitmentfield.service.IRecruitmentFieldService;
import kr.or.inair.individualmember.joboffer.dao.IJobOfferDao;
import kr.or.inair.vo.Job_OfferVO;
import kr.or.inair.vo.Recruitment_FieldVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IJobOfferServiceImpl implements IJobOfferService {
	
	@Autowired
	private IJobOfferDao jobOfferDao;
	@Autowired
	private IRecruitmentFieldService recruitmentFieldService;
	@Autowired
	private IRecruitmentFieldDao recruitmentFieldDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public int getJobListCount() throws Exception {
		return jobOfferDao.getJobListCount();
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public String insertjobOffer(Job_OfferVO insertJobOffer) throws Exception {
		
		String jo_num = jobOfferDao.insertjobOffer(insertJobOffer);
	
		List<Recruitment_FieldVO> insertRecruitmentFieldList = new ArrayList<Recruitment_FieldVO>();
		
		if(insertJobOffer.getRecruitmentFieldList() != null){
			for(Recruitment_FieldVO insertRecruitmentFieldInfo : insertJobOffer.getRecruitmentFieldList()){
				if((insertRecruitmentFieldInfo.getRecruitment_field_name() != null) && (!insertRecruitmentFieldInfo.getRecruitment_field_name().equals(""))){
					insertRecruitmentFieldInfo.setJo_num(jo_num);
					insertRecruitmentFieldList.add(insertRecruitmentFieldInfo);
				}
			}
			recruitmentFieldDao.insertRecruitmentFieldList(insertRecruitmentFieldList);
		}
		
		return jo_num;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<Job_OfferVO> getJobOfferList(Map<String, String> params) throws Exception {
		return jobOfferDao.getJobOfferList(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void deleteJobOffer(String jo_num) throws Exception {
		jobOfferDao.deleteJobOffer(jo_num);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<Job_OfferVO> getAllJobOffer(Map<String, String> params)
			throws Exception {
		return jobOfferDao.getAllJobOffer(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public Job_OfferVO getJobOfferInfo(String jo_num) throws Exception {
		return jobOfferDao.getJobOfferInfo(jo_num);
	}

	@Override
	public List<Job_OfferVO> jobOfferList(Map<String, String> params) throws Exception {
		return jobOfferDao.jobOfferList(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void jobOfferFinish(String jo_num) throws Exception {
		jobOfferDao.jobOfferFinish(jo_num);
	}
	
}
