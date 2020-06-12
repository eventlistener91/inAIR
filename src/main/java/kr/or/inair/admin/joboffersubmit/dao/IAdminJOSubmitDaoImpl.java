package kr.or.inair.admin.joboffersubmit.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IAdminJOSubmitDaoImpl implements IAdminJOSubmitDao {

	@Autowired
	private SqlMapClient client;
}
