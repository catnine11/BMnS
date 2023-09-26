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
public class AskBoardVo {

	private int ask_seq;
	private String ask_title;
	private String ask_contents;
	private String ask_regdate;
	private int user_id;
	private String delflag;
	
}
