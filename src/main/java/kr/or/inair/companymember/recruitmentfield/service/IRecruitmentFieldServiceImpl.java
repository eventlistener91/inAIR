package kr.or.inair.companymember.recruitmentfield.service;

import kr.or.inair.companymember.recruitmentfield.dao.IRecruitmentFieldDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IRecruitmentFieldServiceImpl implements IRecruitmentFieldService {
	@Autowired
	private IRecruitmentFieldDao recruitmentFieldDao;
	
}
