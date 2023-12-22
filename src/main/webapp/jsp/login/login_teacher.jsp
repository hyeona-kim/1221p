<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content" class="row" style="margin:0px;">
		<div class="col-xs-12" style="margin:0px;">

		
		 <table border="0" align="center" style="margin-top:50px">
			 <tr>
			  <td colspan="3" align="center"> 
				<h1><a href="http://ictedu.atosoft.net/"><img src="images/vendor_logo.png"></a></h1>
			  </td>
			 </tr>
			 <tr>
				<td valign="top">
		  			<div style="padding-top:20px">
		  				<img src="images/lms_main_intro.png" style="max-width:100%">
					 </div>
				</td>
				<td width="20px"></td>
				<td valign="top">
				 <form name="theForm" method="post" action="Controller?type=login&select=teacher" onSubmit="return OnAdminLognCheck();">
					<input type="hidden" name="strPrevUrl" value="">
					<input type="hidden" name="serviceYN" id="serviceYN">
						<div class="login-layout">
							<h2>교강사 로그인</h2>
								 <div class="login-form">
									<div class="login-input">
										<div>
											<input type="text" id="strLoginID" name="ID" value="" placeholder="교·강사 아이디" class="form-control input-lg" style="margin-bottom:5px"/>
										</div>
										<div>
											<input type="password"  id="strLoginPwd" name="PW" value="" placeholder="교·강사 비밀번호" autocomplete="atosoft_02 strLoginPwd" class="form-control input-lg"/>
											<input type="hidden" name="strLoginPwd1" id="strLoginPwd1" value="">
										</div>
									</div>
									<div class="login-btn" style="margin-top:10px">
										<input type="submit" value="로그인" class="btn btn-info block full-width" style="cursor:pointer;"/>
									</div>
								</div>
								<div class="login-bottom"></div>
							</div>
						</form>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<div class="clear"></div>
					<div class="copyright" align="center">
						<p class="m-t">Copyright &copy; 한국ict인재개발원  All Rights Reserved.</p>
					</div>
				</td>
			</tr>
		</table>
  </div>
</div>
</body>
</html>