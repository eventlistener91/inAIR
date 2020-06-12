package kr.or.inair.characterquestion.service;
import java.util.List;

import kr.or.inair.characterquestion.dao.ICHARQUESTDao;
import kr.or.inair.vo.CHAR_QuestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Service
public class ICHARQUESTServiceImpl implements ICHARQUESTService {
	@Autowired
	private ICHARQUESTDao characterQuestionDao;

	@Override
	public List<CHAR_QuestVO> char_QuestList() throws Exception {
		List<CHAR_QuestVO> charQuestList = characterQuestionDao.char_QuestList();
		
		return charQuestList;
	}

}
