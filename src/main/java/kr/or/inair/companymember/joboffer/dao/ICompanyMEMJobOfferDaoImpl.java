package kr.or.inair.companymember.joboffer.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICompanyMEMJobOfferDaoImpl implements ICompanyMEMJobOfferDao {
	@Autowired
	private SqlMapClient client;

}
