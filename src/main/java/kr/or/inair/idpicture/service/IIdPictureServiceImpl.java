package kr.or.inair.idpicture.service;

import java.util.Map;

import kr.or.inair.idpicture.dao.IIdPictureDao;
import kr.or.inair.vo.IDPictureVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IIdPictureServiceImpl implements IIdPictureService {
	@Autowired
	private IIdPictureDao idPictureDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void insertIdPicture(IDPictureVO idPicture) throws Exception {
		idPictureDao.insertIdPicture(idPicture);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public IDPictureVO idPictureInfo(Map<String, String> params) throws Exception {
		return idPictureDao.idPictureInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Override
	public void updateIdPicture(IDPictureVO idPicture) throws Exception {
		idPictureDao.updateIdPicture(idPicture);
	}

}
