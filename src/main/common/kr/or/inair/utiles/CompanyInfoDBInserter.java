package kr.or.inair.utiles;

import java.util.Map;

import kr.or.inair.company.servie.ICompanyService;
import kr.or.inair.companyinfo.service.ICompanyInfoService;
import kr.or.inair.vo.CompanyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Component
public class CompanyInfoDBInserter {
	
	@Autowired
	private PlatformTransactionManager transactionManager;
	@Autowired
	private ICompanyInfoService companyInfoService;
	@Autowired
	private ICompanyService companyService;
	
	public void insertBasicCompanyInfo(Map<String, String> params) {
		TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			
			companyService.insertCompany(params);
			transactionManager.commit(status);
			
		} catch (Exception e) {
			transactionManager.rollback(status);
		}
	}
	
	public void insertDetailCompanyInfo(Map<String, String> params) {
		TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			companyInfoService.insertCompanyInfo(params);
			transactionManager.commit(status);
			
		} catch (Exception e) {
			transactionManager.rollback(status);
		}
	}
	
}
