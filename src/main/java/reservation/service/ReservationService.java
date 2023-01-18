package reservation.service;

import java.util.List;

import reservation.dto.ReservationDto;

public interface ReservationService {
//<호텔 예약 서비스>
	public List<ReservationDto> selectReservationList() throws Exception;

	public void insertReservation(ReservationDto reservationDto) throws Exception;
//<예약 조회 서비스>
	public List<ReservationDto> checkReservationInfo(ReservationDto reservationDto) throws Exception;

	public List<ReservationDto> CheckReservation(int checkIdx) throws Exception;

	public ReservationDto reservationInfoWrite() throws Exception;
}
