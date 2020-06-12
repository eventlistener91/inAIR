package kr.or.inair.notice.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.NoticeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class INoticeDaoImpl implements INoticeDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<NoticeVO> noticeList(Map<String, String> params)
			throws Exception {
		return client.queryForList("notice.totalNoticeList",params);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("notice.totalNoticeCount", params);
	}

	@Override
	public List<NoticeVO> indvdlNoticeList(Map<String, String> params)
			throws Exception {
		return client.queryForList("notice.indvdlNoticeList", params);
	}

	@Override
	public String indvdlCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("notice.indvdlNoticeCount", params);
	}

	@Override
	public List<NoticeVO> COMNoticeList(Map<String, String> params)
			throws Exception {
		return client.queryForList("notice.COMNoticeList",params);
	}

	@Override
	public String COMNoticeCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("notice.COMNoticeCount", params);
	}

	@Override
	public NoticeVO noticeInfo(Map<String, String> params) throws Exception {
		return (NoticeVO) client.queryForObject("notice.noticeInfo", params);
	}

	@Override
	public List<NoticeVO> noticeboardList(Map<String, String> params)
			throws Exception {
		return client.queryForList("notice.adminTotalNotice", params);
	}

	@Override
	public String totalNoticeCount(Map<String, String> params) throws Exception {

		return (String) client.queryForObject("notice.adminTotalCount", params);
	}

	@Override
	public void insertNoticeInfo(NoticeVO noticeboardInfo) throws Exception {
		client.insert("notice.insertNoticeboard", noticeboardInfo);
		
	}

	@Override
	public void updateNoticeInfo(NoticeVO noticeboardInfo) throws Exception {
		client.update("notice.updateNoticeboard", noticeboardInfo);
	}

	@Override
	public void deleteNotice(Map<String, String> params) throws Exception {
		client.update("notice.deleteNoticeboard", params);
		
	}
	


}
