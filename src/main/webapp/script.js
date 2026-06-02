function menu2Check() {
	var frm = document.frm;

	if (frm.sid.value.trim() == "") {
		alert("학번이 입력되지 않았습니다!");
		frm.sid.focus();
		return false;
	}

	if (frm.midscore.value.trim() == "" || isNaN(frm.midscore.value)) {
		alert("중간고사는 숫자가 아니거나 입력하지 않았습니다!");
		frm.midscore.focus();
		return false;
	}

	if (frm.finalscore.value.trim() == "" || isNaN(frm.finalscore.value)) {
		alert("기말고사는 숫자가 아니거나 입력하지 않았습니다!");
		frm.finalscore.focus();
		return false;
	}

	if (frm.attend.value.trim() == "" || isNaN(frm.attend.value)) {
		alert("출석은 숫자가 아니거나 입력하지 않았습니다!");
		frm.attend.focus();
		return false;
	}

	if (frm.report.value.trim() == "" || isNaN(frm.report.value)) {
		alert("레포트는 숫자가 아니거나 입력하지 않았습니다!");
		frm.report.focus();
		return false;
	}

	if (frm.etc.value.trim() == "" || isNaN(frm.etc.value)) {
		alert("기타는 숫자가 아니거나 입력하지 않았습니다.");
		frm.etc.focus();
		return false;
	}

	return true;
}

function menu2Reset() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.frm.reset();
}

function menu4Check() {
	var frm = document.frm;

	if (frm.subcode.value.trim() == "") {
		alert("과목코드가 입력되지 않았습니다!");
		frm.subcode.focus();
		return false;
	}

	return true;
}
