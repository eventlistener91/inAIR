
// 회원가입시 정규식 적용

/*
 * [ MEM_ID ]
 * 
 * varchar2 (15 byte)
 * validation : 영문 대소문자 또는 숫자를 사용하여 4~12자리
 */
String.prototype.validationID = function(){
	return /^[A-Za-z0-9]{4,12}$/.test(this);
};

/*
 * [ MEM_PASS ]
 * 
 * varchar2 (30byte)
 * validation : 영문 대소문자 또는 숫자를 사용하여 4~15자리
 */ 
String.prototype.validationPWD = function(){
	   return /^[A-Za-z0-9]{4,15}$/.test(this);
};

/*
 * [ MEM_MAIL ]
 * 
 * varchar2 (40byte)
 * validation : 
 */  
String.prototype.validationMail = function(){
//	  return /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/.text(this);
	return /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i.test(this);
	
};

/*
 * [ MEM_NAME ]
 * 
 * varchar2 (20byte)
 * validation : 한글 1~5글자 또는 영문 1~15자(대소문자 구분 없음)
 */
String.prototype.validationNM = function(){
	  return /^([A-Za-z]{1,15}|[가-힣]{1,5})$/.test(this);
};

/*
 * [ MEM_TEL ]
 * 
 * varchar2 (15byte)
 * validation : 010-0000-0000
 */
String.prototype.validationTEL = function(){
	return /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})[-]{0,1}([0-9]{3,4})[-]{0,1}([0-9]{4})$/.test(this);
};

/*
 * [ COMMON ]
 * 
 * validation : 오직 숫자만 입력 가능.
 */
String.prototype.validationOnlyNum = function(){
	return /^[0-9]{1,}$/.test(this);
};

/*
 * 사업자등록번호
 */
String.prototype.validationBizrNo = function(){
	return /^[0-9]{3}[-]{0,1}[0-9]{2}[-]{0,1}[0-9]{5}$/.test(this);
};

/*
 * 법인등록번호
 */
String.prototype.validationJurirNo = function(){
	return /^[0-9]{13}$/.test(this);
};

String.prototype.validationRanChar = function(){
	return /^[a-z가-힣]$/.test(this);
};