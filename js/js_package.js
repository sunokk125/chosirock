function checkID()		// ID�� �Է¹��� �Ŀ� �˾�â�� ����ָ鼭 
		{  										//   checkId.jsp (�ߺ��˻� ����)�� ȣ���� �ִ� �ڹٽ�ũ��Ʈ �Լ�
			var id = newMem.id.value;		//  form�� �̸��� newMem�� �Ϳ� �ָ��� ��!

			if (id  == "")				//   11~16��:  ID�� �Է¾��� ID �ߺ�üũ ��ư�� Ŭ���� ����� ó��
			{
				alert("ID�� �Է��� �ּ���!"); 
				newMem.id.focus(); 
				return; 
			}

			window.open("checkId.jsp?id="+id,"win", "width=255, height=145, scrollbars=no, resizable=no");
		}
function checkUserValue(){
	if(newMem.id.value==""){
		alert("ID�� �Է��� �ּ���!"); 
			newMem.id.focus(); 
			return; 
	}
	if(newMem.pwd.value==""){
		alert("�н����带 �Է��� �ּ���!"); 
			newMem.pwd.focus(); 
			return; 
	}
	if(newMem.pwdCk.value==""){
		alert("�н����� Ȯ���� �Է��� �ּ���!"); 
			newMem.pwdCk.focus(); 
			return; 
	}
	if(newMem.name.value==""){
		alert("�̸��� �Է��� �ּ���!"); 
			newMem.name.focus(); 
			return; 
	}
	if(newMem.rrn1.value==""){
		alert("�ֹι�ȣ ���ڸ��� �Է��� �ּ���!"); 
			newMem.rrn1.focus(); 
			return; 
	}
	if(newMem.rrn2.value==""){
		alert("�ֹι�ȣ ���ڸ��� �Է��� �ּ���!"); 
			newMem.rrn2.focus(); 
			return; 
	}
	if(newMem.email1.value==""){
		alert("�̸����� �Է��� �ּ���!"); 
			newMem.email1.focus(); 
			return; 
	}
	if(newMem.phone2.value==""){
		alert("�޴�����ȣ�� �Է��� �ּ���!"); 
			newMem.phone2.focus(); 
			return; 
	}
	if(newMem.phone3.value==""){
		alert("�޴�����ȣ�� �Է��� �ּ���!"); 
			newMem.phone3.focus(); 
			return; 
	}
	if(newMem.address1.value==""){
		alert("�ּҸ� �Է��� �ּ���!"); 
			newMem.address1.focus(); 
			return; 
	}
	if(newMem.address2.value==""){
		alert("�� �ּҸ� �Է��� �ּ���!"); 
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
	//	alert("ID�� �Է��� �ּ���!");  
	//	newMem.id.focus();					
	//	return;            

    newPrd.submit();
}

function checkCount(){
	var count = countChoiceForm.count.value;
	if(count==""){
			alert("���� ���� �Է����ּ���");
			countChoiceForm.count.focus();
			return;
	}
	if(count<3){
			alert("���� ���� 3���� �̻����� �Է����ּ���");
			countChoiceForm.count.focus();
			return;
	}
	if(count>10){
			alert("���� ���� 10���� ���Ϸ� �Է����ּ���");
			countChoiceForm.count.focus();
			return;
	}
	countChoiceForm.submit();
}

function checkQty(){
	var qty=productChoiceForm.orderQty.value;
	if(qty==""){
			alert("������ �Է����ּ���");
			productChoiceForm.orderQty.focus();
			return;
	}
	productChoiceForm.submit();
}

function checkOrder(){
	if(orderForm.oname.value==""){
		alert("�ֹ��ڸ� �Է����ּ���");
		orderForm.oname.focus();
		return;
	}
	if(orderForm.address1.value==""){
		alert("�ּҸ� �Է����ּ���");
		orderForm.address1.focus();
		return;
	}
	if(orderForm.address2.value==""){
		alert("���ּҸ� �Է����ּ���");
		orderForm.address2.focus();
		return;
	}
	if(orderForm.ocardNum.value==""){
		alert("ī���ȣ�� �Է����ּ���");
		orderForm.ocardNum.focus();
		return;
	}
	orderForm.submit();

}