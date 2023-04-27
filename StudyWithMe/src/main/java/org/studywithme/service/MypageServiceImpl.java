package org.studywithme.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.studywithme.domain.ReservationCriteria;
import org.studywithme.domain.ReservationVO;
import org.studywithme.domain.UserVO;
import org.studywithme.mapper.MypageMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MypageServiceImpl implements MypageService {

	@Autowired
    private MypageMapper mapper;
	
	@Autowired
	@Qualifier("bcryptPasswordEncoder")
	private PasswordEncoder passwordEncoder;
	
	@Override
	public UserVO mypageGetList(String userId) {
//		log.info("get mypage userdata" + userId);
		return mapper.mypageGetList(userId);
	}

    @Override
    public List<ReservationVO> getReservationList(String userId) {
    	if(userId == null) {
            // userId가 null인 경우, 예외 처리를 수행한다.
            throw new IllegalArgumentException("userId cannot be null");
        }
    	List<ReservationVO> reservationList = mapper.reservationList(userId);
        Collections.reverse(reservationList); // 리스트를 내림차순으로 정렬
        return reservationList;
    }
    
    @Override
	public boolean updatePw(UserVO vo) {
		try {
			String hashedPassword = passwordEncoder.encode(vo.getPassword());
			vo.setPassword(hashedPassword);
			int result = mapper.updatePw(vo);
			return (result == 1);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
    }
    
    @Override
    public boolean deleteUser(String userId) {
        int result = mapper.deleteUser(userId);
        return result > 0;
    }
    
    @Override
    public List<ReservationVO> getReservationListWithPaging(ReservationCriteria recri) {
        if (recri.getUserId() == null) {
            // userId가 null인 경우, 예외 처리를 수행한다.
            throw new IllegalArgumentException("userId cannot be null");
        }
        return mapper.getReservationListWithPaging(recri);
    }



	@Override
	public int getTotalReservationCount(ReservationCriteria recri) {
		return mapper.getTotalReservationCount(recri);
	}

}
