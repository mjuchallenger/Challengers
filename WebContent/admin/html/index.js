const inputBox = document.querySelector(".inputField input");
const addBtn = document.querySelector(".inputField button");
const challengeList = document.querySelector(".challengeList");
const deleteAllBtn = document.querySelector(".footer button");

inputBox.onkeyup = () => {
  let userData = inputBox.value;
  if(userData.trim() != 0){
    addBtn.classList.add("active");
  }else{
    addBtn.classList.remove("active");
  }
}
showTasks();

addBtn.onclick = ()=>{
  let userData = inputBox.value;
  let getLocalStorage = localStorage.getItem("New Challenge");
  if(getLocalStorage == null){
    listArr = [];
  }else{
    listArr =JSON.parse(getLocalStorage);
  }
  listArr.push(userData);
  localStorage.setItem("New Challenge", JSON.stringify(listArr));
  showTasks(); //리스트 보여주기
  addBtn.classList.remove("active");
}

//추가하는 부분

function showTasks(){
  let getLocalStorage = localStorage.getItem("New Challenge");
  if(getLocalStorage == null){
    listArr = [];
  }else{
    listArr = JSON.parse(getLocalStorage);
  }
  const pendingNumb = document.querySelector(".pendingNumb");
  pendingNumb.textContent = listArr.length; //챌린지 횟수 세기

  if(listArr.length > 0){
    deleteAllBtn.classList.add("active");
  } else {
    deleteAllBtn.classList.remove("active");
  }


  let newLitag = '';
  listArr.forEach((element, index) => {
    newLitag += `<li> ${element} <span onclick="deleteTask(${index})"; ><i class="fas fa-trash"></i></span></li>`; //챌린지 리스트 추가 innerhtml, [index]는 삭제할 수 있는 기능 추가
  });


  challengeList.innerHTML = newLitag;
  inputBox.value = "";
}

//삭제하는 부분
function deleteTask(index){
  let getLocalStorage = localStorage.getItem("New Challenge");
  listArr = JSON.parse(getLocalStorage);
  listArr.splice(index, 1); //리스트 하나씩 삭제하기

  //alert 창
  alert('이 챌린지를 지우시겠습니까?')

  //삭제하고 난 이후의 리스트
  localStorage.setItem("New Challenge", JSON.stringify(listArr));
  showTasks();
}


//다 삭제하는 버튼
deleteAllBtn.onclick = () => {
  listArr = [];

  localStorage.setItem("New Challenge", JSON.stringify(listArr));
  showTasks();

  // alert창
  alert('정말로 다 지우시겠습니까?')
}

