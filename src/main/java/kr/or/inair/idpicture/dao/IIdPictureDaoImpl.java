package kr.or.inair.idpicture.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.IDPictureVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IIdPictureDaoImpl implements IIdPictureDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertIdPicture(IDPictureVO idPicture) throws Exception {
		client.insert("idPicture.insertIDPicture", idPicture);
	}

	@Override
	public IDPictureVO idPictureInfo(Map<String, String> params) throws Exception {
		return (IDPictureVO) client.queryForObject("idPicture.idPictureInfo", params);
	}

	@Override
	public void updateIdPicture(IDPictureVO idPicture) throws Exception {
		client.update("idPicture.updateIDPicture", idPicture);
	}

}
