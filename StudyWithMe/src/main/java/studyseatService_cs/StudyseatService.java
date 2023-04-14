package studyseatService_cs;

import java.util.List;

import org.springframework.stereotype.Service;

import studyseatdomain_cs.SeatVO;


public interface StudyseatService {
	public List<SeatVO> useseat(Long cafeno);
	
}
