package kr.or.inair.individualmember.indvdlsecession.service;
import java.util.List;

import kr.or.inair.individualmember.indvdlsecession.dao.IINDVDLDropDao;
import kr.or.inair.vo.INDVDL_DropVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IINDVDLDropServiceImpl implements IINDVDLDropService {
	@Autowired
	private IINDVDLDropDao iNDVDLSecessionDao;

	@Override
	public List<INDVDL_DropVO> indvdlDropOutList() throws Exception {
		return iNDVDLSecessionDao.indvdlDropOutList();
	}

}
