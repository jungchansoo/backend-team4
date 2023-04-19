package studyseatService_cs;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import studyseatController_cs.SeatNotAvailableException;
import studyseatMapper_cs.StudyseatMapper;
import studyseatdomain_cs.SeatVO;

@Service
@AllArgsConstructor
public class StudyseatServiceImpl implements StudyseatService{


	@Setter(onMethod_ = @Autowired)
	private StudyseatMapper mapper;

	@Override
	public List<SeatVO> useseat(int cafeno) {
		return mapper.readuseseat(cafeno);
	}
	
	@Override
	public Map<String, Object> myuseseat(String id) {
		return mapper.getmyreservationInfo(id, "SEAT");
	}
	
	@Override
	@Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	public void insertseat(int cafe_no, int num_using, String id) {
		boolean isAvailable = mapper.isSeatAvailable(cafe_no, num_using);
		if(isAvailable) {
			 throw new SeatNotAvailableException();
		}
		mapper.insert(cafe_no, num_using, id,"SEAT");
	}

	@Override
	public void returnseat(String id) {
		mapper.movedata(id, "SEAT");
		mapper.delete(id, "SEAT");
	}
}
