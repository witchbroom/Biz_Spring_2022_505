# SpringMVC 패턴의 Request, Response
* web browser의 주소창에 ```http://localhost:8080/hello```라고 입력후 Enter를 누르면
* ```http://localhost:8080```에서 실행중인 tomcat에 요청이 전달된다.
* tomcat에 의해 실행중인 ```hello``` project에 요청이 전달된다.
* project에 ```@Controller```가 설정된 class를 찾는다.
* ```@Controller``` class의 메서드 중 ```@RequestMapping의 value가 ```"/"```설정된 부분이 있는지 찾는다.
* ```request```와 일치하는 ```@RequestMapping```을 찾으면 해당 메서드를 실행하여 결과를 web browser로 ```response```한다