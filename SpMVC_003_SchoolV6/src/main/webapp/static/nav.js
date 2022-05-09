document.addEventListener("DOMContentLoaded", () => {
    // 어딘가에 있을 nav tag를 객체 변수에 담아오기
    const nav = document.querySelector("nav");
    // nav tag를 정말 가져왔을때
    if (nav) {
        nav.addEventListener("click", (e) => {

            /*
            e.target
            현재 nav > ul > li 형태로 layout 구성되어 있다
            이 layout 의 제일 바깥쪽인 nav tag에 click event 를 설정했다
            마우스로 nav tag의 어느곳을 클릭하면
            event가 nav > ul > li 로 점점 전파된다

            nav > li tag를 클릭하면
            li tag에 대한 정보가 e.target에 담기게 된다
            결국 js 코드에서 다수의 li tag 에 일일히 event를 설정한 것처럼
            사용할 수 있게된다
            */

            const target = e.target;
            const navText = target.innerText;

            let url = `${rootPath}`


            if (navText === "학생정보") {
                url += "/student";
            } else if (navText === "성적정보") {
                alert("성적정보를 입력합니다");
            } else if (navText === "로그인") {
                alert("로그인 창을 띄웁시다");
            } else if (navText === "회원가입") {
                alert("아직 회원가입은 받지 않습니다");
            }
            document.location.href = url
        });
    }
});