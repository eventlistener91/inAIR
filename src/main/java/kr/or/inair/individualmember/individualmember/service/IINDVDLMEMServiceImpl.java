package kr.or.inair.individualmember.individualmember.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.inair.idpicture.dao.IIdPictureDao;
import kr.or.inair.individualmember.individualmember.dao.IINDVDLMEMDao;
import kr.or.inair.utiles.AttachFileMapper;
import kr.or.inair.vo.IDPictureVO;
import kr.or.inair.vo.INDVDLMEMVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class IINDVDLMEMServiceImpl implements IINDVDLMEMService {
	@Autowired
	private IINDVDLMEMDao individualMemberDao;
	@Autowired
	private AttachFileMapper fileMapper;
	@Autowired
	private IIdPictureDao idPictureDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public INDVDLMEMVO indvdlmemInfo(Map<String, String> params)
			throws Exception {
		INDVDLMEMVO indvdlmemInfo = null;
		indvdlmemInfo = individualMemberDao.indvdlmemInfo(params);
		return indvdlmemInfo;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public INDVDLMEMVO searchid(Map<String, String> params)
			throws Exception {
		INDVDLMEMVO indvdlmemidInfo = null;
		indvdlmemidInfo = individualMemberDao.searchid(params);
		return indvdlmemidInfo;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public INDVDLMEMVO searchpass(Map<String, String> param)
			throws Exception {
		INDVDLMEMVO indvdlmempassInfo = null;
		indvdlmempassInfo = individualMemberDao.searchpass(param);
		return indvdlmempassInfo;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void updatePassword(Map<String, String> params) throws Exception {
		individualMemberDao.updatePassword(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertIndvdlMember(INDVDLMEMVO indvdlMemInfo)
			throws Exception {
		individualMemberDao.insertIndvdlMember(indvdlMemInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public INDVDLMEMVO duplCheck(Map<String, String> params) throws Exception {
		return individualMemberDao.duplCheck(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public int getIndvdlMemCount() throws Exception {
		return individualMemberDao.getIndvdlMemCount();
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void updateIndvdlMember(INDVDLMEMVO indvdlMemInfo) throws Exception {
		individualMemberDao.updateIndvdlMember(indvdlMemInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public INDVDLMEMVO indvdlInfo(Map<String, String> params) throws Exception {
		INDVDLMEMVO indvdlmemInfo = individualMemberDao.indvdlInfo(params);
		return indvdlmemInfo;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void passwordChange(Map<String, String> params) throws Exception {
		individualMemberDao.passwordChange(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void deleteIndvdlMember(Map<String, String> params) throws Exception {
		individualMemberDao.deleteIndvdlMember(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public INDVDLMEMVO getLoginINDVDLMEMInfo(String indvdl_id) throws Exception {
		return individualMemberDao.getLoginINDVDLMEMInfo(indvdl_id);
	}

	
}
