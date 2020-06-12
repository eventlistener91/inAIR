package kr.or.inair.admin.individualmember.service;
import java.util.List;
import java.util.Map;

import kr.or.inair.admin.individualmember.dao.IAdminINDVDLMEMDao;
import kr.or.inair.vo.INDVDLMEMVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IAdminIndividualMemberServiceImpl implements IAdminIndividualMemberService {
	@Autowired
	private IAdminINDVDLMEMDao indvdlMemberDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<INDVDLMEMVO> getINDVDLMemList(Map<String, String> params)
			throws Exception {
		return indvdlMemberDao.getINDVDLMemList(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public String getTotalCount(Map<String, String> params) throws Exception {
		return indvdlMemberDao.getTotalCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public String getDeleteINDVDLMEMTotalCount(Map<String, String> params)
			throws Exception {
		return indvdlMemberDao.getDeleteINDVDLMEMTotalCount(params);
	}

	@Override
	public List<INDVDLMEMVO> getDelteINDVDLMemList(Map<String, String> params)
			throws Exception {
		return indvdlMemberDao.getDelteINDVDLMemList(params);
	}

	@Override
	public INDVDLMEMVO getINDVDLMEMInfo(String indvdl_id) throws Exception {
		return indvdlMemberDao.getINDVDLMEMInfo(indvdl_id);
	}
	
}
