package com.gd.bmss.vo;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class StockVo {

	
private int stock_number  ;
private int	book_seq      ;
private int	book_price   ;

private String status_title;
private String status_code;
private int book_code;

public StockVo(int book_seq) {
	super();
	this.book_seq = book_seq;
}

public StockVo(int book_seq, String status_code) {
	super();
	this.book_seq = book_seq;
	this.status_code = status_code;
}


	


}
