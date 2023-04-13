package studyseatService_cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.Setter;
import studyseatMapper_cs.StudyseatMapper;

public class StudyseatServiceImpl implements StudyseatService{

	
	@Setter(onMethod_ = @Autowired)
	private StudyseatMapper mapper;
	
	@Override
	public List<Integer> useseat(int cafeno) {
		
		return mapper.readuseseat(cafeno);
	}

}
