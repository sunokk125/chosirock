function checkID()		// ID를 입력받은 후에 팝업창을 띄워주면서 
		{  										//   checkId.jsp (중복검사 수행)를 호출해 주는 자바스크립트 함수
			var id = newMem.id.value;		//  form의 이름이 newMem인 것에 주목할 것!

			if (id  == "")				//   11~16행:  ID를 입력없이 ID 중복체크 버튼을 클릭할 경우의 처리
			{
				alert("ID를 입력해 주세요!"); 
				newMem.id.focus(); 
				return; 
			}

			window.open("checkId.jsp?id="+id,"win", "width=255, height=145, scrollbars=no, resizable=no");
		}
function checkUserValue(){
	if(newMem.id.value==""){
		alert("ID를 입력해 주세요!"); 
			newMem.id.focus(); 
			return; 
	}
	if(newMem.pwd.value==""){
		alert("패스워드를 입력해 주세요!"); 
			newMem.pwd.focus(); 
			return; 
	}
	if(newMem.pwdCk.value==""){
		alert("패스워드 확인을 입력해 주세요!"); 
			newMem.pwdCk.focus(); 
			return; 
	}
	if(newMem.name.value==""){
		alert("이름을 입력해 주세요!"); 
			newMem.name.focus(); 
			return; 
	}
	if(newMem.rrn1.value==""){
		alert("주민번호 앞자리를 입력해 주세요!"); 
			newMem.rrn1.focus(); 
			return; 
	}
	if(newMem.rrn2.value==""){
		alert("주민번호 뒷자리를 입력해 주세요!"); 
			newMem.rrn2.focus(); 
			return; 
	}
	if(newMem.email1.value==""){
		alert("이메일을 입력해 주세요!"); 
			newMem.email1.focus(); 
			return; 
	}
	if(newMem.phone2.value==""){
		alert("휴대폰번호를 입력해 주세요!"); 
			newMem.phone2.focus(); 
			return; 
	}
	if(newMem.phone3.value==""){
		alert("휴대폰번호를 입력해 주세요!"); 
			newMem.phone3.focus(); 
			return; 
	}
	if(newMem.address1.value==""){
		alert("주소를 입력해 주세요!"); 
			newMem.address1.focus(); 
			return; 
	}
	if(newMem.address2.value==""){
		alert("상세 주소를 입력해 주세요!"); 
			newMem.address2.focus(); 
			return; 
	}
	newMem.submit();

}
function zipCheck()
{
	window.open("zipCheck.jsp", "win", "width=600, height=200, scrollbars=yes, status=yes");
}

function ozipCheck()
{
	window.open("ozipCheck.jsp", "win", "width=600, height=200, scrollbars=yes, status=yes");
}

function manager_zipCheck()
{
	window.open("manager_zipCheck.jsp", "win", "width=600, height=200, scrollbars=yes, status=yes");
}


function checkPrdValue()             
{                                           
	//if(newMem.id.value == "")    
    //{
	//	alert("ID를 입력해 주세요!");  
	//	newMem.id.focus();					
	//	return;            

    newPrd.submit();
}

function checkCount(){
	var count = countChoiceForm.count.value;
	if(count==""){
			alert("반찬 수를 입력해주세요");
			countChoiceForm.count.focus();
			return;
	}
	if(count<3){
			alert("반찬 수를 3가지 이상으로 입력해주세요");
			countChoiceForm.count.focus();
			return;
	}
	if(count>10){
			alert("반찬 수를 10가지 이하로 입력해주세요");
			countChoiceForm.count.focus();
			return;
	}
	countChoiceForm.submit();
}

function checkQty(){
	var qty=productChoiceForm.orderQty.value;
	if(qty==""){
			alert("개수를 입력해주세요");
			productChoiceForm.orderQty.focus();
			return;
	}
	productChoiceForm.submit();
}

function checkOrder(){
	if(orderForm.oname.value==""){
		alert("주문자를 입력해주세요");
		orderForm.oname.focus();
		return;
	}
	if(orderForm.address1.value==""){
		alert("주소를 입력해주세요");
		orderForm.address1.focus();
		return;
	}
	if(orderForm.address2.value==""){
		alert("상세주소를 입력해주세요");
		orderForm.address2.focus();
		return;
	}
	if(orderForm.ocardNum.value==""){
		alert("카드번호를 입력해주세요");
		orderForm.ocardNum.focus();
		return;
	}
	orderForm.submit();

}