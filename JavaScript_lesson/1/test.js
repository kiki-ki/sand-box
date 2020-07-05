function hoge() {
  alert("hello");
}

let e = document.getElementsByClassName("hoge");
e[0].addEventListener("click",hoge,false);
