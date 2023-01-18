package reservation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import reservation.dto.ReservationDto;

@Mapper
public interface ReservationMapper {
//<호텔 예약 서비스>
	List<ReservationDto> selectReservationList() throws Exception;
	void insertReservation(ReservationDto reservationDto) throws Exception;
	ReservationDto selectReservationDetail(int reservationIdx) throws Exception;
	ReservationDto checkDuplicate(ReservationDto reservationDto) throws Exception;
//<예약 조회 서비스>
	List<ReservationDto> CheckReservation(int checkIdx) throws Exception;
	List<ReservationDto> checkReservationInfo(ReservationDto reservationDto) throws Exception;
	ReservationDto reservationInfoWrite() throws Exception;
}
