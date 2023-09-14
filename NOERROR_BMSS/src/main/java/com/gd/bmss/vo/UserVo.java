package com.gd.bmss.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * USERINFO테이블 VO생성
 * @author KDH
 * @since 2023-09-13
 */
@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserVo {
	private int user_id;
	private String user_name;
	private String user_email;
	private String user_password;
	private String user_birth;
	private String user_phone;
	private String user_address;
	private String user_auth;
	private String user_delflag;
	private String penalty_date;
	private String user_joindate;
	private String gubun;
	
	private List<ReserveVo> reserveVo; 
	private List<BorrowVo> borrowVo;
	
}
