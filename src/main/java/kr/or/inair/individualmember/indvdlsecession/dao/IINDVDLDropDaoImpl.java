package kr.or.inair.individualmember.indvdlsecession.dao;
import java.util.List;

import kr.or.inair.vo.INDVDL_DropVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IINDVDLDropDaoImpl implements IINDVDLDropDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<INDVDL_DropVO> indvdlDropOutList() throws Exception {
		return client.queryForList("indvdlDrop.getIndvdlDropList");
	}

}
