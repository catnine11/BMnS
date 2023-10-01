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
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PayVo {

	private int pay_seq;
	private int pay_money;
	private String pay_method;
	private int pay_status;
	private String pay_time;
	
	private String pay_title;
	
}
