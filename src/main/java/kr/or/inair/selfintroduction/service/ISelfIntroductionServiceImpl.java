package kr.or.inair.selfintroduction.service;
import kr.or.inair.selfintroduction.dao.ISelfIntroductionDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ISelfIntroductionServiceImpl implements ISelfIntroductionService {
	@Autowired
	private ISelfIntroductionDao selfIntroductionDao;

}
