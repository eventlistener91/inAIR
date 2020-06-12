package kr.or.inair.individualmember.classofposition.service;
import java.util.List;

import kr.or.inair.individualmember.classofposition.dao.IClassOfPositionDao;
import kr.or.inair.vo.ClassOfPositionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IClassOfPositionServiceImpl implements IClassOfPositionService {
	@Autowired
	private IClassOfPositionDao classOfPositionDao;

	@Override
	public List<ClassOfPositionVO> getClassOfPositionList() throws Exception {
		return classOfPositionDao.getClassOfPositionList();
	}

	
}
