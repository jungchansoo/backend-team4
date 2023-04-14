package studyseatMapper_cs;

import java.util.List;

import studyseatdomain_cs.SeatVO;

public interface StudyseatMapper {
	public List<SeatVO> readuseseat(Long cafeno);
}
