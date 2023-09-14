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

public class OrderVo {
	
	
	
private int stock_number    ;
private int order_number    ;
private int order_quantity  ;
private int order_price     ;
private String order_date      ;
private int pay_status      ;
private int user_id         ;
                            
}
