package kr.or.inair.characterquestion.dao;

import java.util.List;

import kr.or.inair.vo.CHAR_QuestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICHARQUESTDaoImpl implements ICHARQUESTDao {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public List<CHAR_QuestVO> char_QuestList() throws Exception {
		return client.queryForList("charQuest.charQuestList");
	}

}
