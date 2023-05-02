package org.studywithme.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.ReviewVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
		,"file:src/main/webapp/WEB-INF/spring/security-context.xml"
		,"file:src/main/webapp/WEB-INF/spring/mailAuth-context.xml"
}
)
@Log4j
public class ReviewMapperTests {
	@Setter(onMethod_ = @Autowired)
	private ReviewBoardMapper mapper;
	
	@Test //테스트 완료
	public void testGetBoardList() {
		Criteria cri = new Criteria();
		List<ReviewVO> list = mapper.getBoardList(5, cri);
		assertNotNull(list);
		log.info("Board List: " + list);
	}
	
	@Test //테스트 완료
	public void testGetTotalCount() {
		Criteria cri = new Criteria();
		int totalCount = mapper.getTotalCount(5, cri);
		assertNotNull(totalCount);
		log.info("Total Count: " + totalCount);
	}
	
	@Test  //테스트 완료
	public void testInsert() {
		ReviewVO board = new ReviewVO();
		board.setTitle("테스트 제목2");
		int cafeNum = 1;
		board.setUserId("testuser");
		board.setContent("테스트 내용2");
		mapper.insert(cafeNum, board);
		log.info("Inserted Board: " + board);
	}
	
	@Test //테스트 완료
	public void testRead() {
		ReviewVO board = mapper.read(1L);
		assertNotNull(board);
		/*
		 * assertEquals(1, board.getReviewNo());
		 */
		log.info("Read Board: " + board);
	}
	
	@Test //테스트 완료
	public void testUpdate() {
		ReviewVO board = new ReviewVO();
		board.setReviewNo(1);
		board.setTitle("수정된 테스트 제목");
		board.setContent("수정된 테스트 내용");
		int updatedCount = mapper.update(board);
		assertEquals(1, updatedCount);
		log.info("Updated Board: " + board);
	}
	
	@Test //테스트 완료
	public void testDelete() {
		mapper.deleteComments(5L);
		int deletedCount = mapper.delete(5L);
		assertEquals(1, deletedCount);
		log.info("Deleted Board with review_no: " + 5L);
	}
	
	@Test //테스트 완료
	public void testIncreaseUpvotes() {
		Long reviewNo = 1L; // 테스트할 리뷰 번호
	    mapper.increaseUpvotes(reviewNo);
	}

	@Test //테스트 완료
	public void testIncreaseDownvotes() {
		Long reviewNo = 1L; // 테스트할 리뷰 번호
	    mapper.increaseDownvotes(reviewNo);
	}
}
