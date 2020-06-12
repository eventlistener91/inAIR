package kr.or.inair.characterresult.service;
import java.util.List;
import java.util.Map;

import kr.or.inair.characterlist.dao.ICHARListDao;
import kr.or.inair.characterresult.dao.ICHARResultDao;
import kr.or.inair.vo.CHAR_ResultVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ICHARResultServiceImpl implements ICHARResultService {
	@Autowired
	private ICHARResultDao characterResultDao;
	@Autowired
	private ICHARListDao characterListDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<CHAR_ResultVO> selectCharResult(Map<String, String> parmas) throws Exception {
		List<CHAR_ResultVO> charResultList = characterResultDao.selectCharResult(parmas);
		return charResultList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void insertCharResult(Map<String, String> params) throws Exception {
		params.put("char_num", "");
		
		String char_num = characterListDao.insertCharList(params);

		params.put("char_num", char_num);
		
		characterResultDao.insertCharResult(params);
		
	}

	@Override
	public List<CHAR_ResultVO> charScoreChart() throws Exception {
		List<CHAR_ResultVO> result = characterResultDao.charScoreChart();
		return result;
	}

}
