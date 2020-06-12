package kr.or.inair.mentorfile.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.MentorVO;
import kr.or.inair.vo.Mentor_FileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IMentorFileDaoImpl implements IMentorFileDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertFileItem(List<Mentor_FileVO> mentorFileList) throws Exception {
		try {
			client.startTransaction();
			for(Mentor_FileVO mentorfileInfo : mentorFileList){
				client.insert("mentorboard_file.insertFileItem", mentorfileInfo);
			}
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		
	}

	@Override
	public Mentor_FileVO mentorfileItemInfo(Map<String, String> params)
			throws Exception {
		return (Mentor_FileVO) client.queryForObject("mentorboard_file.mentorboardfileItemInfo", params);
	}

}
