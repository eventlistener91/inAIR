package kr.or.inair.hopecompany.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IHopeCOMDaoImpl implements IHopeCOMDao {
	@Autowired
	private SqlMapClient client;

}
