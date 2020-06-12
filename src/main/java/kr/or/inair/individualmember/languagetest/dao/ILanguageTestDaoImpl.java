package kr.or.inair.individualmember.languagetest.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ILanguageTestDaoImpl implements ILanguageTestDao {
	@Autowired
	private SqlMapClient client;

}
