<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=ko>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>의상 평가</title>
</head>
<body>
	<h2>의상 평가</h2>

	<form id="form" name="form" method="POST" enctype="multipart/form-data">
		<label for="uploadFile">이미지 입력</label> 
		<input type="file"
			id="uploadFile" name="uploadFile" capture="camera" accept="image/*"
			class="btn btn-default btn-lg"> 
		<div>
		<label for="age">나이</label> 
		<input type="text" id="age" name="age" class="btn btn-default btn-lg">
		</div>
		<div>
		<label for="sex">성별</label> 
		<label><input type="radio" name="sex" value="Female" checked> 여자</label>
     	<label><input type="radio" name="sex" value="male"> 남자</label>
		</div>
		<input type="text" name ="filename"  id="filename" value=""  style="display: none">
		<input type="text" name ="recominput"  id="recominput" value=""  style="display: none">
	</form>
	<button id="btn-upload">사진 업로드</button>
	
	<div id="recom" style="display:none">
		<button id="btn-recom">추천 받기</button>
	</div>


	<div id="loadicon" style="display: none">
		<img src="data/icon/loadicon.gif">
	</div>

	<div id="result" style="display: none">
		<div>
			<img id="afimg" src="">
		</div>

		<div>
			<label for="upper">상의 :</label> <input type="text" id="upper"
				name="upper" value="" size="50"><br> <br> <label
				for="lower">하의:</label> <input type="text" id="lower" name="lower"
				value="" size="50"><br> <br> <label for="outer">외투:</label>
			<input type="text" id="outer" name="outer" value="" size="50"><br>
			<br> <label for="full">전신:</label> <input type="text" id="full"
				name="full" value="" size="50"><br> <br>
		</div>

		<div>
			<img id="ogimg" src="">
		</div>

	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
		
	</script>



	<script type="text/javascript">
		$('#btn-upload').on('click', function() {
			$("#recom").hide();
			$("#result").hide();
			$("#loadicon").show();
			var form = new FormData(document.getElementById('form'));
			$.ajax({
				url : "/upload.do",
				data : form,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(json) {
					//console.log(response);
					$("#loadicon").hide();
					var res = JSON.parse(json)
					var data = JSON.parse(res.data)

					$("#upper").attr('value', data.상의);
					$("#lower").attr('value', data.하의);
					$("#outer").attr('value', data.외투);
					$("#full").attr('value', data.전신);
					$("#afimg").attr('src', res.afimg);
					$("#ogimg").attr('src', res.ogimg);
					$("#filename").attr('value', res.afimg);
					$("#recominput").attr('value', data.외투);
					$("#result").show();
					$("#recom").show();

				},
				error : function(jqXHR) {
					$("#result").hide();
					$("#loadicon").hide();
					console.log('error');
				}
			});
		});
		
		$('#btn-recom').on('click', function() {
			$("#recom").hide();
			$("#result").hide();
			$("#loadicon").show();
			var form = new FormData(document.getElementById('form'));
			$.ajax({
				url : "/recom.do",
				data : form,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(json) {
					//console.log(response);
					$("#loadicon").hide();
					
				},
				error : function(jqXHR) {
					$("#result").hide();
					$("#loadicon").hide();
					console.log('error');
				}
			});
		});
	</script>

</body>
</html>
