package kr.or.inair.individualmember.language.service;
import java.util.List;

import kr.or.inair.individualmember.language.dao.ILanguageDao;
import kr.or.inair.vo.LanguageVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ILanguageServiceImpl implements ILanguageService {
	@Autowired
	private ILanguageDao languageDao;

	@Override
	public List<LanguageVO> getLanguageList() throws Exception {
		return languageDao.getLanguageList();
	}

	
}
