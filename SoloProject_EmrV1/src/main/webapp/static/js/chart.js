document.addEventListener("DOMContentLoaded", () => {
  const patient = document.querySelector("table.patient");

  // 옵셔널 체이닝(Optinal Chaning) : 선택적 체이닝 연산자
  // 객체의 속성에 접근하는 경우에 사용함
  patient?.addEventListener("click", (e) => {
    const target = e.target;
    const tr = target?.closest("TR");
    const seq = tr?.dataset.seq;

    if (seq) {
      document.location.href = `${rootPath}/emrs/detail/${seq}`;
    }
  });
});
