package com.gd.bmss.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 도서상태를 나타내는 Vo
 * 도서상태(BOOK_STATUS) 테이블과 상태코드(BOOK_STATUSCODE) 테이블 통합
 * @author NGR
 * @since 2023.09.14.
 */
@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Book_StatusVo {

	private String status;

	private String status_code;
	private String book_seq;
	private String status_title;
	private String book_code;

	private List<BorrowVo> borwVo;
	private List<ReserveVo> resvVo;

}
