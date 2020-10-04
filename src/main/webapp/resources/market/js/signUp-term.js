$(document).ready(function() {
		$("#signUpInfo").unbind("click").click(function(e){
			e.preventDefault();
			fn_moveToSignUpInfo();
		});
		
		$("#jb-checkbox-0").change(function(e){
			e.preventDefault();
			if($("#jb-checkbox-0").prop("checked") == true) fn_allCheck();
		});
	});
	

	function fn_moveToSignUpInfo() {
		if ($("#jb-checkbox-1").prop("checked") == false || $("#jb-checkbox-2").prop("checked") == false) alert("약관에 동의해주시기 바랍니다.");
		else {
			fn_pageSubmit("signUpInfo", "frm")
		}
	}
	function fn_allCheck() {
		$("input[name=jb-checkbox]:checkbox").prop("checked", true);
}