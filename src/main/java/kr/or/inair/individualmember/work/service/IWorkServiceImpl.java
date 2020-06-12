package kr.or.inair.individualmember.work.service;
import java.util.List;

import kr.or.inair.individualmember.work.dao.IWorkDao;
import kr.or.inair.vo.WorkVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IWorkServiceImpl implements IWorkService {
	@Autowired
	private IWorkDao workDao;

	@Override
	public List<WorkVO> getWorkList() throws Exception {
		return workDao.getWorkList();
	}

	
}
