package org.studywithme.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.NoticeVO;
import org.studywithme.mapper.NoticeBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	private NoticeBoardMapper mapper;

	@Override
	public List<NoticeVO> getBoardList(String type, String keyword, int pageNum, int amount) {
		log.info("=============");
		log.info("type " + type);
		log.info("keyword " + keyword);
		log.info("pageNum " + pageNum);
		log.info("amount " + amount);
		return mapper.getBoardList(type, keyword, pageNum, amount);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri.getType(), cri.getKeyword());
	}

	@Override
	public void register(NoticeVO board) {
		mapper.insert(board);
	}

	@Override
	public NoticeVO get(Long noticeNo) {
		return mapper.read(noticeNo);
	}

	@Override
	public boolean modify(NoticeVO board) {
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long noticeNo) {
		return mapper.delete(noticeNo) == 1;
	}

}
