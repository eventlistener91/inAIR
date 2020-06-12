package kr.or.inair.individualmember.languagetest.service;
import kr.or.inair.individualmember.languagetest.dao.ILanguageTestDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ILanguageTestServiceImpl implements ILanguageTestService {
	@Autowired
	private ILanguageTestDao languageTestDao;

}
