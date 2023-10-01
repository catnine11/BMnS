package com.gd.bmss.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class BookDto {
	private int book_code;
	private String isbn;
	private String title;
	private String author;
	private int genre_code;
	private String publisher ;
	private int price;
	private String publish_date;
	private String thumbnail;
	
	public BookDto(String isbn, String title, String author, String publisher, int price, String thumbnail,String publish_date) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.thumbnail = thumbnail;
		this.publish_date=publish_date;
	}
	
}