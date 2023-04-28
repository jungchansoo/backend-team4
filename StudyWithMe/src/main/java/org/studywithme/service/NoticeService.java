package org.studywithme.service;

import java.util.List;

import org.studywithme.domain.Criteria;
import org.studywithme.domain.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> getBoardList(String type, String keyword, int pageNum, int amount);
	public int getTotal(Criteria cri);
	public void register(NoticeVO board);
	public NoticeVO get(Long noticeNo);
	public boolean modify(NoticeVO board);
	public boolean remove(Long noticeNo);
}
