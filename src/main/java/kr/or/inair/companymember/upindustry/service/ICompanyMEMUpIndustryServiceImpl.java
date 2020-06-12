package kr.or.inair.companymember.upindustry.service;
import java.util.List;

import kr.or.inair.companymember.upindustry.dao.ICompanyMEMUpIndustryDao;
import kr.or.inair.vo.UpIndustryVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ICompanyMEMUpIndustryServiceImpl implements ICompanyMEMUpIndustryService {
	@Autowired
	private ICompanyMEMUpIndustryDao upIndustryDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<UpIndustryVO> getUpIndutyList() throws Exception {
		return upIndustryDao.getUpIndutyList();
	}

}
