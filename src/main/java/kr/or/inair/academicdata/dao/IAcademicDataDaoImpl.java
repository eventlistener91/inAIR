package kr.or.inair.academicdata.dao;

import java.util.List;

import kr.or.inair.vo.Academic_DetaVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;


@Repository
public class IAcademicDataDaoImpl implements IAcademicDataDao {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertAcademicDataList(
			List<Academic_DetaVO> insertAcademicDetaList) throws Exception{
		for(Academic_DetaVO academicDetaVo : insertAcademicDetaList){
			client.insert("academicDeta.insertAcademicDataInfo", academicDetaVo);
		}
	}

	@Override
	public void updateAcademicDataList(
			List<Academic_DetaVO> updateAcademicDetaList) throws Exception {
		for(Academic_DetaVO academicDetaVo : updateAcademicDetaList){
			client.insert("academicDeta.updateAcademicDataInfo", academicDetaVo);
		}
	}

	
	
}
