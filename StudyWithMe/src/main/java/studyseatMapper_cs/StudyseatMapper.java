package studyseatMapper_cs;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import studyseatdomain_cs.SeatVO;

public interface StudyseatMapper {
	public List<SeatVO> readuseseat(Long cafeno);
	public void insert(@Param("cafe_no")int cafe_no, @Param("num_using")int num_using, @Param("id")String id);
	public boolean isSeatAvailable(@Param("cafe_no")int cafe_no, @Param("num_using")int num_using);
}
