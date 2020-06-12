package kr.or.inair.individualmember.uppro.service;
import java.util.List;

import kr.or.inair.individualmember.uppro.dao.IUpPRODao;
import kr.or.inair.vo.UpProVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IUpPROServiceImpl implements IUpPROService {
	@Autowired
	private IUpPRODao upPRODao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<UpProVO> getUpPROList() throws Exception {
		return upPRODao.getUpPROList();
	}

	
}
