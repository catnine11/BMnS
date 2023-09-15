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

	
private int	stock_number  ;
private String sell_status   ;
private int	book_seq      ;
private int	book_price   ;
public StockVo(int book_seq) {
	super();
	this.book_seq = book_seq;
}
		

}
