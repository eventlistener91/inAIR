package kr.or.inair.characterlist.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.CHAR_ListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICHARListDaoImpl implements ICHARListDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<CHAR_ListVO> char_List() throws Exception {
		return client.queryForList("charList.selectCharList");
	}

	@Override
	public String insertCharList(Map<String, String> params) throws Exception {
		return (String)client.insert("charList.insertCharList", params);
	}

}
