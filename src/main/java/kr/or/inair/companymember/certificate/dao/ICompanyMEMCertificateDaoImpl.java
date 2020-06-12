package kr.or.inair.companymember.certificate.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICompanyMEMCertificateDaoImpl implements ICompanyMEMCertificateDao {
	@Autowired
	private SqlMapClient client;

}
