package kr.or.inair.mentor.dao;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.tagext.TryCatchFinally;

import kr.or.inair.vo.MentorLowproVO;
import kr.or.inair.vo.MentorVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IMentorDaoImpl implements IMentorDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<MentorVO> mentorList(Map<String, String> params)
			throws Exception {
		return client.queryForList("mentorboard.mentorList", params);
	}
	
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("mentorboard.totalCount", params);
	}

	@Override
	public String totalComment(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return (String) client.queryForObject("mentorboard.totalComment", params);
	}

	@Override
	public MentorVO mentorboardInfo(Map<String, String> params)
			throws Exception {
		MentorVO mentorboardInfo = null;
		try {
			client.startTransaction();
			//조회수 update 
			client.update("mentorboard.updateHIT", params);
			//전체 댓글 수 update 
			client.update("mentorboard.totalCommentUpdate", params);
			mentorboardInfo = (MentorVO) client.queryForObject("mentorboard.mentorInfo", params);
			
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return mentorboardInfo;
	}

	@Override
	public void updateMentorboard(MentorVO mentorboardInfo) throws Exception {
		client.update("mentorboard.updateMentorboard",mentorboardInfo);
		
	}

	@Override
	public void deleteMentorboard(Map<String, String> params) throws Exception {
		client.update("mentorboard.deleteMentorboard",params);
		
	}

	@Override
	public String insertMentorboard(MentorVO mentorboardInfo) throws Exception {
		return (String) client.insert("mentorboard.insertMentorboard", mentorboardInfo);
	}

	@Override
	public List<MentorVO> mentorComment(Map<String, String> commentParams)
			throws Exception {
		return client.queryForList("mentorboard.mentorboardComment", commentParams);
	}

	@Override
	public void insertMentorReply(MentorVO mentorboardInfo) throws Exception {
		try {
			client.startTransaction();
			
			String mentor_sn;
			if("0".intern() == mentorboardInfo.getMentor_sn().intern()){
				mentor_sn = (String) client.queryForObject("mentorboard.incrementSEQ", mentorboardInfo);
			}else{
				client.update("mentorboard.updateSEQ", mentorboardInfo);
				mentor_sn = String.valueOf(Integer.parseInt(mentorboardInfo.getMentor_sn())+1);
			}
			mentorboardInfo.setMentor_sn(mentor_sn);
			
			String mentor_depth = String.valueOf(Integer.parseInt(mentorboardInfo.getMentor_depth())+1);
			mentorboardInfo.setMentor_depth(mentor_depth);

			client.insert("mentorboard.insertMentorboardReply", mentorboardInfo);
		
			client.commitTransaction();
			
		} finally {
			client.endTransaction();
			
		}
		
	}

	@Override
	public List<MentorLowproVO> mentorLowproList(Map<String, String> params)
			throws Exception {
		return client.queryForList("mentorboard.mentorLowproList", params);
	}

	@Override
	public void updateComment(MentorVO mentorboardInfo) throws Exception {
		client.update("mentorboard.updateComment", mentorboardInfo);
		
	}

	@Override
	public List<MentorVO> mentorPopularity() throws Exception {
		return client.queryForList("mentorboard.mentorPopularity");
	}

	
	
	

}
