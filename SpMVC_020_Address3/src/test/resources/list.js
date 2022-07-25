document.addEventListener("DOMContentLoaded", () => {
    const table = document.querySelector("table");
    const search = document.querySelector("input[name=search]")
    const name = document.querySelector("input[name=a_name]")
    const tel = document.querySelector("input[name=a_tel]")
    const address = document.querySelector("input[name=a_address]")

    // td 클릭하면 감싸고있는 tr 반응하고 tr의 데이터 불러오기
  td?.addEventListener("click", (e) => {
    const td = e.target;
    if (td.tagName === "TD") {
      const tr = td.closest("TR");
      const seq = tr.dataset.seq;
      document.location.href = `${rootPath}/detail?seq=${seq}`;
    }
  });
    
  // 유효성검사
    search?.addEventListener("keypress", (e) => {
        if()
    })
});
