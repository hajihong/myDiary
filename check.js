function check() {
    if(document.signUpPage.id.value == "") {
        alert("아이디를 입력하세요");
        return false;
    }

    if(document.signUpPage.isCheck.value != document.signUpPage.id.value) {
        alert("아이디 중복체크를 해주세요");
        return false;
    }

    if(document.signUpPage.pw.value == "") {
        alert("비밀번호를 입력하세요");
        return false;
    }

    if(document.signUpPage.pw2.value == "") {
        alert("2차 비밀번호를 입력하세요");
        return false;
    }

    if(document.signUpPage.pw.value != document.signUpPage.pw2.value) {
        alert("비밀번호가 일치하지 않습니다");
        return false;
    }

    if(document.signUpPage.name.value == "") {
        alert("이름을 입력하세요");
        return false;
    }

    if(document.singUpPage.auth.value == "") {
        alert("권한을 입력하세요");
        return false;
    }
}

function updateCheck() {
    if(document.updateInfoPage.id.value == "") {
        alert("아이디를 입력하세요");
        return false;
    }

    if(document.updateInfoPage.isCheck.value != document.updateInfoPage.id.value) {
        alert("아이디 중복체크를 해주세요");
        return false;
    }

    if(document.updateInfoPage.pw.value == "") {
        alert("비밀번호를 입력하세요");
        return false;
    }

    if(document.updateInfoPage.pw2.value == "") {
        alert("2차 비밀번호를 입력하세요");
        return false;
    }

    if(document.updateInfoPage.pw.value != document.updateInfoPage.pw2.value) {
        alert("비밀번호가 일치하지 않습니다");
        return false;
    }

    if(document.updateInfoPage.name.value == "") {
        alert("이름을 입력하세요");
        return false;
    }
}

function idCheck(){
    if(document.signUpPage.id.value == "") {
        alert("아이디를 입력하세요");
        return false;
    }

    url = "idCheck.jsp?id=" + document.signUpPage.id.value;
    window.open(url, "아이디중복체크",
            "width=300, height=100, tollbar=no,location=no, status=no, menubar=no,scrollbars=no,resizable=no,left=200,top=100");
}

function idDuplicateCheck(){
    if(document.updateInfoPage.id.value == "") {
        alert("아이디를 입력하세요");
        return false;
    }
    
    url = "idDuplicateCheck.jsp?id=" + document.updateInfoPage.id.value;
    window.open(url, "아이디중복체크",
    "width=300, height=100, tollbar=no,location=no, status=no, menubar=no,scrollbars=no,resizable=no,left=200,top=100");
}

function userId(){
    opener.document.getElementById("isCheck").value = opener.document.getElementById("id").value;
    window.close();
}

function checkOnlyOne(el) {
    const checkboxes = document.getElementsByName("auth");

    checkboxes.forEach((e) => {
        e.checked = false;
    })

    el.checked = true;
}