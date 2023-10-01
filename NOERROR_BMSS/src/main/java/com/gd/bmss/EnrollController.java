package com.gd.bmss;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.bmss.mapper.ISearchDao;
import com.gd.bmss.vo.BookDto;
@RestController
public class EnrollController {
	
	@Autowired
	private ISearchDao sdao;
	
	 @PostMapping(value = "/save.do")
	    public boolean booksave( BookDto dto ) throws ParseException {
		
		String[] isbns 	=dto.getIsbn().split(" ");
		
		for(String isbn:isbns) {
			if(isbn.length()==13) {
				isbn.trim();
				dto.setIsbn(isbn);
			}else {
				dto.setIsbn("없음");
			}
		}
		boolean isc = sdao.saveBook(dto) ;
		 
		 return isc;
		 
	    }

}
