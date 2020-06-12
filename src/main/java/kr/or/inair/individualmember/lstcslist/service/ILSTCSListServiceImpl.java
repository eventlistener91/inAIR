package kr.or.inair.individualmember.lstcslist.service;
import kr.or.inair.individualmember.lstcslist.dao.ILSTCSListDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ILSTCSListServiceImpl implements
		ILSTCSListService {
	@Autowired
	private ILSTCSListDao linguisticeDatailsDao;

}
