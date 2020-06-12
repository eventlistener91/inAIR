package kr.or.inair.individualmember.upindustry.service;
import java.util.List;

import kr.or.inair.individualmember.upindustry.dao.IUpIndustryDao;
import kr.or.inair.vo.UpIndustryVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IUpIndustryServiceImpl implements IUpIndustryService {
	@Autowired
	private IUpIndustryDao upIndustryDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<UpIndustryVO> getUpIndustryList() throws Exception {
		return upIndustryDao.getUpIndustryList();
	}

}
