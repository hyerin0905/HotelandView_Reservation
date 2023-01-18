package reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import reservation.dto.ReservationDto;
import reservation.mapper.ReservationMapper;

@Slf4j
@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationMapper reservationMapper;
	
//<호텔 예약 서비스>
	@Override
	public List<ReservationDto> selectReservationList() throws Exception {
		return reservationMapper.selectReservationList();
	}

	@Override
	public void insertReservation(ReservationDto reservationDto) throws Exception {
		ReservationDto duple = reservationMapper.checkDuplicate(reservationDto);
		System.out.println(duple);
		if (duple == null) {
			reservationMapper.insertReservation(reservationDto);
		} else {
			System.out.println("중복됨");
		}
	}

//<예약 조회 시스템>
	@Override
	public List<ReservationDto> checkReservationInfo(ReservationDto reservationDto) throws Exception {
		return reservationMapper.checkReservationInfo(reservationDto);		
	}

	@Override
	public List<ReservationDto> CheckReservation(int checkIdx) throws Exception {
		return reservationMapper.CheckReservation(checkIdx);
	}

	@Override
	public ReservationDto reservationInfoWrite() throws Exception {
		return reservationMapper.reservationInfoWrite();
	}

}
