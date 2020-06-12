package kr.or.inair.career.dao;
import java.util.List;

import kr.or.inair.vo.CareerVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICareerDaoImpl implements ICareerDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertCareerInfoList(List<CareerVO> insertCareerInfoList)
			throws Exception {
		for(CareerVO careerVo : insertCareerInfoList){
			client.insert("career.insertCareerInfo", careerVo);
		}
	}

	@Override
	public void updateCareerInfoList(List<CareerVO> updateCareerInfoList)
			throws Exception {
		for(CareerVO careerVo : updateCareerInfoList){
			client.insert("career.updateCareerInfo", careerVo);
		}
	}
	
}
