package com.callor.naver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.naver.config.QualifierConfig;
import com.callor.naver.model.BookVO;
import com.callor.naver.service.BookService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/books")
public class BooksController {
	
	@Qualifier(QualifierConfig.SERVICE.BOOKS_V1) 
	private final BookService bookService;

	public BooksController(BookService bookService) {
		this.bookService = bookService;
	}
	
	
	@RequestMapping(value={"/",""}  )
	public String home() {
		/*
		 * return "문자열" 형식은
		 * 명시적으로 어떤 jsp 파일을 rendering 할 것인지
		 * 알려주는 것이다
		 * 현재 method 를 요청한 URL 에 대하여 jsp 을 
		 * 명시적으로 전달한다
		 */
		return "redirect:/books/list";
	}
	
	@RequestMapping(value="/list")
	public String list(Model model) {
		/*
		 * return null 형식은
		 * 암시적으로 어떤 jps 파일을 rendering 할 것인지
		 * 알려주는 것이다
		 * 현재 method 요청한 URL 이 명시적으로 명확할 경우
		 * null 을 return 하면 Spring 에서 자체적으로 폼더/파일 형식으로
		 * 구성을 하여준다
		 */
		
		List<BookVO> bookList = bookService.selectAll();
		
		// bookList 에 담긴 데이터를 BOOKS 이름으로 변수에 담아
		// jsp 파일로 보내겠다
		model.addAttribute("BOOKS",bookList);
		return null;
	}
	
	/*
	 * RequestMethod 가 없는 Mapping 은
	 * GET 요청이나 POST 요청을 모두 처리하는 method 가 되어버린다
	 * 
	 * method=RequestMethod.GET 로 지정을 하면
	 * a tag link 를 눌렀을때의 요청만 처리하도록 역할을 제한한다.
	 */
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String insert() {
		return null;
	}
	
	/*
	 * method=POST 가 부착된 form 으로 감싼 데이터들이 전송되었을때
	 * 요청을 받아 처리할 method
	 */
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insert(BookVO bookVO) {
		log.debug("도서정보 : " + bookVO.toString());
		/*
		 * MyBATIS 에서 DB 에 INSERT 를 수행하고 나면
		 * INSERT 된 데이터의 행 개수를 return 한다
		 * 만약 return 된 값이 0 이라면 한 개의 데이터도 INSERT 하지 못한 것이다
		 * 1 이상의 정수값이 return 되면 몇개의 데이터가 INSERT 되었는지
		 * 확인할 수 있다
		 */
		int ret = bookService.insert(bookVO);
		// if(ret > 0) {
		// 	return "OK"
		// } else {
		//	return "FAIL"
		// }
		
		/*
		 * Controller method 의 return type 이 String 일때
		 * views/*.jsp 파일을 열어 rendering 이에게 보여라
		 * 이러한 것을 Fowarding 이라고 한다
		 * 
		 * redirect 로 시작되는 문자열을 만나면
		 * 서버의 다른 URL 로 요청을 전달해버린다
		 */
		
		return "redirect:/books/list";
		
		/*
		 * Controller method 의 return type 이 Spring 일때

		 */
	}
	
	@RequestMapping(value="/{isbn}/detail",method=RequestMethod.GET)
	public String detail(@PathVariable("isbn") String isbn, Model model) {
		
		BookVO bookVO = bookService.findById(isbn);
		model.addAttribute("BOOK", bookVO);
		return "books/detail";
		
	}
	
	/*
	 * 전달받은 id 값으로 데이터를 Select 하고 model 에 담아서
	 * 입력 form 으로 전달한다
	 */
	@RequestMapping(value="/{isbn}/update",method=RequestMethod.GET)
	public String update(@PathVariable("isbn") String isbn, Model model) {
		
		BookVO bookVO = bookService.findById(isbn);
		model.addAttribute("BOOK", bookVO);
		return "books/insert";
	}
	
	@RequestMapping(value="/{isbn}/update",method=RequestMethod.POST)
	public String update(BookVO bookVO) {
		
		int ret = bookService.update(bookVO);
		
		String retStr = String.format("redirect:/books/%s/detail", bookVO.getIsbn());
		return retStr;
	}
	
	@RequestMapping(value="/{isbn}/delete",method=RequestMethod.GET)
	public String delete(@PathVariable("isbn") String isbn) {
		
		// 삭제한 데이터개수를 return 한다
		int ret = bookService.delete(isbn);

		return "redirect:/books/list";
		
	}
	
}
