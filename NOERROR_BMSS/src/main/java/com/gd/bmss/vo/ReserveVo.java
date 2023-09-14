package com.gd.bmss.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 예약(BOOK_RESERVE)테이블의 Vo
 * @author NGR
 * @since 2023.09.14.
 */
@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReserveVo {
	
	private String reserve_seq   ;
	private String reserve_title ;
	private Date reserve_date  ;
	private String reserve_status;
	private String user_id       ;
	private String book_seq      ;

	
}
