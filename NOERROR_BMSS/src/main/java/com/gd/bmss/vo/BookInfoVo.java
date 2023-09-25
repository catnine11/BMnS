package com.gd.bmss.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 도서 상세정보 Vo
 * 도서상세정보(BOOKINFO)테이블과 장르테이블(BOOK_GENRE)테이블 통합
 * @author NGR
 * @since 2023.09.14.
 */
@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BookInfoVo {

	private String book_code;
	private String isbn;
	private String title;
	private String author;
	private String genre_code;
	private String publisher;
	private String price;
	private String publish_date;
	private String thumbnail;

	private String content;
	private String intro;
	private String review;
	private String authorinfo;

	private String genre_name;

	private List<Book_StatusVo> bsVo;
	
	private int book_price;
	private int stock_number;

	
}
