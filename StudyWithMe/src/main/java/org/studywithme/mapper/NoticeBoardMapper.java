package org.studywithme.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.studywithme.domain.AddTicketVO;
import org.studywithme.domain.NoticeVO;

public interface NoticeBoardMapper {

	public List<NoticeVO> getBoardList(@Param("type") String type, @Param("keyword") String keyword, @Param("pageNum") int pageNum, @Param("amount") int amount);
	public int getTotalCount(@Param("type") String type, @Param("keyword") String keyword);
	public void insert(NoticeVO board);
	public NoticeVO read(Long noticeNo);
	public int update(NoticeVO board);
	public int delete(Long noticeNo);
}
