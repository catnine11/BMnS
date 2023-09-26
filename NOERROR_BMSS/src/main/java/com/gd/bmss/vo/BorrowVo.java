package com.gd.bmss.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 대출(BOOK_BORROW)테이블의 Vo
 * 
 * @author NGR
 * @since 2023.09.14.
 */
@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BorrowVo {

	private String borrow_seq;
	private String borrow_title;
//	private Date start_date    ;
//	private Date return_date   ;
	private String start_date;
	private String return_date;
	private String renew;
	private String borrow_status;
	private String user_id;
	private String book_seq;
	
	private String penalty_date;

}
