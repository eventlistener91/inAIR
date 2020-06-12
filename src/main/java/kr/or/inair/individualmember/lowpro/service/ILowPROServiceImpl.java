package kr.or.inair.individualmember.lowpro.service;
import java.util.List;
import java.util.Map;

import kr.or.inair.individualmember.lowpro.dao.ILowPRODao;
import kr.or.inair.vo.LowProVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ILowPROServiceImpl implements ILowPROService {
	@Autowired
	private ILowPRODao lowProfessionDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<LowProVO> getLowPROList(Map<String, String> params)
			throws Exception {
		return lowProfessionDao.getLowPROList(params);
	}

	@Override
	public List<LowProVO> getLowProfession() throws Exception {
		return lowProfessionDao.getLowProfession();
	}

	
}
