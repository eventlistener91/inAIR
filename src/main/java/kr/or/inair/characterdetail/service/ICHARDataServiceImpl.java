package kr.or.inair.characterdetail.service;
import java.util.List;
import java.util.Map;

import kr.or.inair.characterdetail.dao.ICHARDataDao;
import kr.or.inair.vo.CHAR_DETAVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ICHARDataServiceImpl implements ICHARDataService {
	@Autowired
	private ICHARDataDao characterDetailDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public CHAR_DETAVO charDetailInfo(Map<String, String> params) throws Exception {
		CHAR_DETAVO charDetailInfo = characterDetailDao.charDetailInfo(params);
		return charDetailInfo;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<CHAR_DETAVO> getCharDetaList() throws Exception {
		return characterDetailDao.getCharDetaList();
	}

}
