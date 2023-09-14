package com.gd.bmss;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class SpringUtils {

	public static void servletAlert(HttpServletResponse resp, String msg, String url) throws IOException {
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		String response = String.format("<script>alert('%s'); location.href='./%s'</script>",msg,url);
		out.printf(response);
		out.flush();
	}
	
}
