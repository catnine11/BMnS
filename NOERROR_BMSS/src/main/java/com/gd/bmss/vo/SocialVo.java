package com.gd.bmss.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * SOCIALINFO테이블 VO생성
 * @author KDH
 * @since 2023-09-13
 */
@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SocialVo {
	private int social_id;
	private String social_name;
	private String social_email;
	private String social_phone;
	private String social_token;
	private String social_auth;
	private String social_gubun;
}
