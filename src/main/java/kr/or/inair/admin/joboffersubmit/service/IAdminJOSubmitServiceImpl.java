package kr.or.inair.admin.joboffersubmit.service;
import kr.or.inair.admin.joboffersubmit.dao.IAdminJOSubmitDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IAdminJOSubmitServiceImpl implements IAdminJOSubmitService {
	@Autowired
	private IAdminJOSubmitDao jobOfferSubmitDao;

}
