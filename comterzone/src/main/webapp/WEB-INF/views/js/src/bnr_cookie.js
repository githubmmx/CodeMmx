function evt_banner_cls(id){
	document.getElementById(id).style.display = 'none';
	bnrSetCookie(id + '_bnr_cook', 'bnr_cls_one', 1);
}

function evt_banner_cls_year(id){
	document.getElementById(id).style.display = 'none';
	bnrSetCookie(id + '_bnr_cook', 'bnr_cls_one', 365);
}

/*��Ű ����*/
function bnrSetCookie(cName, cValue, cDay) {
  var expire = new Date();
  expire.setDate(expire.getDate() + cDay);
  cookies = cName + '=' + escape(cValue) + '; path=/ '; // �ѱ� ������ �������� escape(cValue)�� �մϴ�.
  if (typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
  document.cookie = cookies;
}