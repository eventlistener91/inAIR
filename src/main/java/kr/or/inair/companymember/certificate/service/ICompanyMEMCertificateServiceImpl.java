package kr.or.inair.companymember.certificate.service;
import kr.or.inair.companymember.certificate.dao.ICompanyMEMCertificateDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ICompanyMEMCertificateServiceImpl implements ICompanyMEMCertificateService {
	@Autowired
	private ICompanyMEMCertificateDao cerificatieDao;

}
