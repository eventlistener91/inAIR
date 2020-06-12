package kr.or.inair.characterlist.service;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.or.inair.characterlist.dao.ICHARListDao;
import kr.or.inair.characterresult.dao.ICHARResultDao;
import kr.or.inair.vo.CHAR_ListVO;
import kr.or.inair.vo.CHAR_ResultVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Service
public class ICHARListServiceImpl implements ICHARListService {
	@Autowired
	private ICHARListDao characterListDao;
	@Autowired
	private ICHARResultDao characterResultDao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<CHAR_ListVO> char_List() throws Exception {
		List<CHAR_ListVO> charList = characterListDao.char_List();
		
		return charList;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public String insertCharList(Map<String, String> params) throws Exception {
		return characterListDao.insertCharList(params);
	}

}
