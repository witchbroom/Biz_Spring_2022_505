package com.callor.score.controller.api;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.callor.score.model.StudentVO;
import com.callor.score.service.StudentService;

import lombok.extern.slf4j.Slf4j;

/*
 * @Controller 클래스는 request(요청)에 대하여 보통 view(.jsp)파일을
 * rendering하여 response(응답)하도록 설계하는 Router 클래스이다
 * 
 * 이 클래스에 @ResponseBody 를 부착하면 view를 response하는 대신에
 * 직접 문자열을 전송하거나 객체(List, VO)를 JSON type으로 response하도록
 * method에 적용을 한다
 * 
 * @RestController 클래스는 request에 대해서 기본값으로 JSON을 response하도록
 * 설계하는 Router 클래스이다
 * 
 * 모든 method에 마치 @ResponseBody가 부착된 것처럼 작동을 한다
 * Spring RestController를 통하여 JSON 데이터를 response하기 위해서는
 * JackBind Dependency가 거의 필수적으로 요구된다
 * 
 * RestController는 view를 rendering하지 않는다
 */
@Slf4j
@CrossOrigin(origins= {"http://localhost:3000","http://127.0.0.1","http://192.168.0.*:3000"})
@RestController
@RequestMapping(value="/api/student")
public class APIStudentController {
	
	private final StudentService stService;

	public APIStudentController(StudentService stService) {
		this.stService = stService;
	}
	
	@RequestMapping(value={"/",""},method=RequestMethod.GET)
	public List<StudentVO> student(){
		return stService.selectAll();
	}
	
	@RequestMapping(value="/{st_num}/check",method=RequestMethod.GET)
	public String stNumCheck(@PathVariable("st_num") String st_num) {
		StudentVO stVO = stService.findById(st_num);
		if(stVO == null) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
	@RequestMapping(value="/{st_num}",method=RequestMethod.GET)
	public StudentVO getStudent(@PathVariable("st_num") String st_num) {
		return stService.findById(st_num);
	}
	
	/*
	 * Client 에서 fetch, Ajax 데이터를 POST로 보낼때
	 * 데이터를 Serialize(직렬화) 하여 body에 담아서 전송한다
	 * 
	 * Serialize된 POST body에 담긴 데이터를 Controller에서 VO에 받을때는
	 * 반드시 @RequestBody 속성을 추가해줘야한다
	 * 
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(@RequestBody StudentVO stVO) {
		log.debug("전달받은 데이터 {}", stVO.toString());
		int ret = stService.update(stVO);
		
		if(ret > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
	/*
	 * http://localhost:8080/score/api/student/학번/delete로 요청을 했을때
	 * 학번에 해당하는 학생의 데이터를 삭제할 수 있도록 method 생성
	 * stService.delete(학번), stDao.delete(학번) student-mapper.xml.delete 를
	 * 작성하여 학생의 데이터를 삭제할 수 있도록 코드 작성
	 */
	
	@RequestMapping(value="/{st_num}/delete",method=RequestMethod.GET)
	public int delete(@PathVariable("st_num") String st_num) {
		
		int del = stService.delete(st_num);
		
		return del;
	}
	

	
	/*
	 * method의 return type
	 * 
	 * void : 아무것도 아닌 값을 return 하거나 말거나
	 */
	public void voidMethod() {
		return; // 아무것도 없는 값을 return, method를 종료한다
	}
	
	// primitive type : 정수, 실수, 문자 등등 기본 type의 값을 return
	public int intMethod() {
		// return type이 int 형이므로 최소 0이라도 return해야한다
		// return을 한다는 것은 이제 더 이상 할일이 없어서 결과를 다시 되돌리기
		// return을 만나면 method는 종료한다
		return 0;
	}
	
	public char charMethod() {
		return 'A'; // return type 이 char(문자)이므로 최소 한개의 임의 문자라도 return 
	}
	
	// class(참조) type : String, VO, DTO, List 등의 클래스(객체) type return
	public String strMethod() {
		return null; // return할 값이 없으면 최소 null값이라도 return을 해야한다
		// return을 만나면 method가 더이상 할일이 없다
		// return null : 나를 호출한 곳에 보낼 데이터가 없다
	}
	
	

}
