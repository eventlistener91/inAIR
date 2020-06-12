package kr.or.inair.individualmember.lstcslist.dao;
import java.util.List;

import kr.or.inair.vo.LSTCS_ListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ILSTCSListDaoImpl implements ILSTCSListDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertLstcsListList(List<LSTCS_ListVO> insertLstcsListList)
			throws Exception {
		for(LSTCS_ListVO lstcsListVo : insertLstcsListList){
			client.insert("lstcsList.insertLstcsListInfo", lstcsListVo);
		}
	}

	@Override
	public void updateLstcsListList(List<LSTCS_ListVO> updateLstcsListList)
			throws Exception {
		for(LSTCS_ListVO lstcsListVo : updateLstcsListList){
			client.insert("lstcsList.updateLstcsListInfo", lstcsListVo);
		}
	}

	
}
