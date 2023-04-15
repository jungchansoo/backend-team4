package org.studywithme.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.studywithme.domain.StudyCafeVO;

public interface StudyCafeMapper {
	
	public int getTotalCount(String keyword);
	
	public List<StudyCafeVO> selectStudyCafeList(@Param("keyword") String keyword, @Param("currentPage") int currentPage, @Param("perPage") int perPage);
}
