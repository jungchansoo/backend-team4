package org.studywithme.service;

import java.util.List;

import org.studywithme.domain.ReservationCriteria;
import org.studywithme.domain.ReservationVO;
import org.studywithme.domain.UserVO;

public interface MypageService {
    public UserVO mypageGetList(String userId);
    public List<ReservationVO> getReservationList(String userId);
    public boolean updatePw(UserVO vo);
    public boolean deleteUser(String userId);
    
    public List<ReservationVO> getReservationListWithPaging(ReservationCriteria recri);
	public int getTotalReservationCount(ReservationCriteria recri);
}

