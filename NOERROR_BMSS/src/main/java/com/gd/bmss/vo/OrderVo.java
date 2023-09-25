package com.gd.bmss.vo;

import java.util.List;

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

public class OrderVo {


	private int order_seq;
	private int stock_number;
	private int order_quantity; 
	private int order_price;
	private String order_date;
	private int pay_status; 
	private int user_id;
	private String user_address;
	private String status_title  ;
	private String thumbnail     ;
	private String genre_code    ;
	private String author        ;

		
	private List<PayVo> payVo;
	private int book_code; 


	//	    private List<StockVo> stockvo;


}
