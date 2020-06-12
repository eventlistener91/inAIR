package kr.or.inair.companymember.joboffer.service;
import kr.or.inair.companymember.joboffer.dao.ICompanyMEMJobOfferDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ICompanyMEMJobOfferServiceImpl implements ICompanyMEMJobOfferService {
	@Autowired
	private ICompanyMEMJobOfferDao jobOfferDao;

}
