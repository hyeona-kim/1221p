<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content" class="row" style="margin: 0px;">
		<div class="col-xs-12" style="margin: 0px;">


			<form class="form-horizontal" method="post"
				data-parsley-validate="true" id="CompanyStu" name="CompanyStu"
				action="SLogin_ok.asp" onSubmit="return OnAdminLognCheck();">
				<input type="hidden" name="strPrevUrl" value="">
				<table border="0" align="center" style="margin-top: 50px">
					<tr>
						<td colspan="3" align="center">
							<h1>
								<a href="http://ictedu.atosoft.net/"><img
									src="images/vendor_logo.png"></a>
							</h1>
						</td>
					</tr>
					<tr>
						<td valign="top">

							<div class="login-layout">
								<h2>수강생 로그인</h2>
								<div class="login-form">
									<div class="login-input">
										<div>
											<input type="text" id="search" name="ID"
												placeholder="수강생 이름" class="form-control input-lg"
												style="margin-bottom: 5px" /> 
												<input type="hidden" name="strCode" id="strPN">
										</div>
										<div>
											<input type="password" id="strLoginPwd" name="PW"
												placeholder="수강생 비밀번호" autocomplete="atosoft_02 strLoginPwd"
												class="form-control input-lg" /> <input type="hidden"
												name="strLoginPwd1" id="strLoginPwd1" value="">
										</div>
									</div>
									<div class="login-bottom"
										style="padding-bottom: 20px; color: red; text-align: left">
										*이름을 입력하시고 본인의 휴대폰을 꼭 선택해주세요!
										<div class="login-btn" style="margin-top: 10px">
											<input type="submit" value="로그인"
												class="btn btn-info block full-width"
												style="cursor: pointer;" />
										</div>
									</div>
									<div class="login-bottom"></div>
								</div>
								</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div class="clear"></div>
							<div class="copyright" align="center">
								<p class="m-t">Copyright &copy; 한국ict인재개발원 All Rights
									Reserved.</p>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
		</div>
</body>
</html>