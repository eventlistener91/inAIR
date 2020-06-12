package kr.or.inair.individualmember.cerificatie.dao;
import java.util.List;

import kr.or.inair.vo.CerificatieVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICerificatieDaoImpl implements ICerificatieDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertCerificatieList(List<CerificatieVO> insertCerificatieList) throws Exception {
		for(CerificatieVO cerificatieVo : insertCerificatieList){
			client.insert("cerificatie.insertCerificatieInfo", cerificatieVo);
		}
	}

	@Override
	public void updateCerificatieList(List<CerificatieVO> updateCerificatieList)
			throws Exception {
		for(CerificatieVO cerificatieVo : updateCerificatieList){
			client.insert("cerificatie.updateCerificatieInfo", cerificatieVo);
		}
	}

}
