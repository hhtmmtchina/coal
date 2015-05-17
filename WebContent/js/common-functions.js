function companyType(selectType){
		$("#username").empty();
		if(selectType == "-1"){
			$("#username").append("<option value=''>请选择姓名</option>");
		}else if(selectType == "1"){
			$("#username").append("<option value=''>请选择姓名</option><option value='朔州车务段'>朔州车务段</option>");
		}else if(selectType == "2"){
			$("#username").append("<option value=''>请选择姓名</option>" +
					"<option value='里八庄'>里八庄</option>"
					+"<option value='怀仁'>怀仁</option>"
					+"<option value='宋家庄'>宋家庄</option>"
					+"<option value='金沙滩'>金沙滩</option>"
					+"<option value='北周庄'>北周庄</option>"
					+"<option value='岱岳'>岱岳</option>"
					+"<option value='东榆林'>东榆林</option>"
					+"<option value='袁树林'>袁树林</option>"
					+"<option value='神头'>神头</option>"
					+"<option value='大新'>大新</option>"
					+"<option value='朔州'>朔州</option>"
					+"<option value='前寨'>前寨</option>"
					+"<option value='阳方口'>阳方口</option>"
					+"<option value='宁武'>宁武</option>"
					+"<option value='庄儿上'>庄儿上</option>"
					+"<option value='李家平'>李家平</option>"
					+"<option value='五寨'>五寨</option>"
					+"<option value='安塘'>安塘</option>"
					+"<option value='秦家庄'>秦家庄</option>"
					+"<option value='岢岚'>岢岚</option>"
					+"<option value='长城梁'>长城梁</option>");
		}else if(selectType == "3"){
			$("#username").append("<option value=''>请选择姓名</option><option value='怀仁'>怀仁</option><option value='神头'>神头"
					+"</option><option value='朔州'>朔州</option><option value='宁武'>宁武</option>");
		}
	}

function validate(){
	var pass = $("#pass").val();
	var confirm_pass = $("#confirm_pass").val();
	var usertype = $("#usertype").val();
	var username = $("#username").val();
	var mobile = $("#mobile").val();
	if(pass == ""){
		alert("密码不能为空!");
		return false;
	} 
	if(confirm_pass != pass){
		alert("两次输入的密码不一样,请重新输入!");
		$("#confirm_pass").val("");
		return false;
	}
	if(usertype == "-1" || usertype == ""){
		alert("单位名称不能为空!");
		return false;
	}
	if(username == "" || username == "-1"){
		alert("姓名不能为空!");
		return false;
	}
	 var re = /^1\d{10}$/;
	 // if(!(/^1[3|5][0-9]\d{4,8}$/.test(sMobile)))
	 if(mobile != ""){
		 if(!re.test(mobile)){
			 alert("手机号错误!");
			 return false;
		 }
	 }
	window.form.submit();
}