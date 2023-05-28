<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .uploadResult {
       width: 100%;
   }

   .uploadResult ul {
       display: flex;
       flex-flow: row;
       justify-content: center;
       align-items: center;
       padding: 0;
   }

   .uploadResult ul li {
       list-style: none;
       padding: 10px;
   }

   .uploadResult ul li img {
       width: 100px;
   }
   
   .uploadResult ul li span {color: dimgray;}
</style>
<script>
	$(document).ready(function() {

		// 익명함수 정의함과 동시에 호출
		(function(){
			var bno = "${board.bno}";
			$.getJSON("/board/getAttachList", {bno: bno}, function(arr){
				console.log(arr);
				
				var str="";
				
				$(arr).each(function(i,attach) {
					if (attach.fileType) {
						var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
						str += "<li style='cursor:pointer' data-path='"+attach.uploadPath+"'";
						str += " data-uuid='"+attach.uuid+"' data-fileName='"+attach.fileName+"'data-type='"+attach.fileType+"'>";
						str += "<span> " + attach.fileName + " </span>";
						str += " <button type='button' data-file='"+fileCallPath+"' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button>"
						str += " <div>";
						str += "<img src='/display?fileName=" + fileCallPath + "'>";
						str += "</div>";
						str += "</li>";
					} else {
						var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);
						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
						str += "<li style='cursor:pointer' data-path='"+attach.uploadPath+"'";
						str += " data-uuid='"+attach.uuid+"' data-fileName='"+attach.fileName+"'data-type='"+attach.fileType+"'>";
						str += "<span> " + attach.fileName + " </span>";
						str += " <button type='button' data-file='"+fileCallPath+"' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button>"
						str += " <div>";
						str += "<img src='/resources/img/attachment.png'></a>";
						str += "</div>";
						str += "</li>";
					}
				});
				
				$(".uploadResult ul").html(str);
			});
		})();
		</script>
</head>
<body>
<!-- 첨부파일 --------------------------------->
<<div class="row">
   <div class="col-lg-12">
      <div class="card shadow mb-4">
         <div class="card-header py-3">
            <h4 class="m-0 font-weight-bold text-primary">File Attach</h4>
         </div>
         <div class="card-body">
            <div class="form-group uploadDiv">
               <input type="file" name="uploadFile" multiple>
            </div>
            <div class="uploadResult">
               <ul></ul>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- 첨부파일 End -------------->	 

<button type="submit" data-oper="modify" class="btn btn-primary btn-sm">
	Modify
</button>
</body>
</html>