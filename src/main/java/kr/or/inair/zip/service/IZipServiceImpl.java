package kr.or.inair.zip.service;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.ZipVO;
import kr.or.inair.zip.dao.IZipDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IZipServiceImpl implements IZipService{

	@Autowired
	private IZipDao zipDao;
	
	@Override
	public List<ZipVO> getZipList(Map<String, String> params) throws Exception {
		return zipDao.getZipList(params);
	}

}
