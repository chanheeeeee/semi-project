<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.board.vo.*" %>
<%  
	Board b=(Board)request.getAttribute("board");
	ReviewBoard rb=(ReviewBoard)request.getAttribute("reviewBoard");
%>
<%@ include file="/views/common/header.jsp" %>
    <div class="container">
      <ul class="progressbar">
        <li class="active">Step 1. 정보확인</li>
        <li>Step 2. 작성자 평가</li>
        <li>Step 3. 후기글 작성</li>
      </ul>
    </div>
    <br><br><br>
	<form action="<%=request.getContextPath() %>/board/reviewupdateend.do?memberNo=<%=loginMember.getMember_no()%>&boardNo=<%=b.getWdNo()%>&reviewNo=<%=rb.getReviewSeq() %>&oriFile=<%=rb.getImg()%>" method="post" enctype="multipart/form-data">
    <table id="writeTable2" style="text-align:center;">
        <tr>
            <th colspan="4">
            <div style="display:flex; justify-content:center">
                제목   <input type="text" name="review_title" id="title_input" value="<%=rb.getReviewTitle()%>"><br>
                <!-- 수정할 이미지 -->
                <input type="file" name="reviewImg" value="<%=rb.getImg()%>">
                <!-- 기존 이미지 -->
                <input type="hidden" name="oriFile" value="<%=rb.getImg()%>"> 
             </div>
             </th>
        </tr>
        <tr>
            <th></th>
            <td colspan="3" style="text-align: center;">
                <form method="post">
                    <textarea id="editor" name="review_content"><%=rb.getReviewContent()%></textarea>
                </form>
            </td>
        </tr>
        <tr>
            <th></th>
            <th colspan="4">
                <div class="wrap" style="margin: 5%;">
                	<button class="button" onclick="location.replace('<%=request.getContextPath()%>/board/grade.do');">이전</button>&nbsp;&nbsp;&nbsp;
                    <input type="submit" class="button" value="등록">
                    <input type="hidden" name="grade" value="<%=request.getParameter("grade")%>">
                </div>

            </th>
        </tr>
    </table>
    </form>
   

        <!-- 웹에디터 -->
    <script>
        $(function(){
            var plugins = [
                "advlist", "autolink", "lists", "link", "image", "charmap", "print", "preview", "anchor",
                "searchreplace", "visualblocks", "code", "fullscreen", "insertdatetime", "media", "table",
                "paste", "code", "help", "wordcount", "save"
            ];
            var edit_toolbar = 'formatselect fontselect fontsizeselect |'
                       + ' forecolor backcolor |'
                       + ' bold italic underline strikethrough |'
                       + ' alignjustify alignleft aligncenter alignright |'
                       + ' bullist numlist |'
                       + ' table tabledelete |'
                       + ' link image';
        
            tinymce.init({
                language: "ko_KR",
                selector: '#editor',
                height: 500,
                menubar: false,
                plugins: plugins,
                toolbar: edit_toolbar,
                
                image_title: true,
                automatic_uploads: true,
                file_picker_types: 'image',
                /* and here's our custom image picker*/
                file_picker_callback: function (cb, value, meta) {
                    var input = document.createElement('input');
                    input.setAttribute('type', 'file');
                    input.setAttribute('accept', 'image/*');
                    input.onchange = function () {
                        var file = this.files[0];
        
                        var reader = new FileReader();
                        reader.onload = function () {
                            var id = 'blobid' + (new Date()).getTime();
                            var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
                            var base64 = reader.result.split(',')[1];
                            var blobInfo = blobCache.create(id, file, base64);
                            blobCache.add(blobInfo);
                            cb(blobInfo.blobUri(), { title: file.name });
                        };
                        reader.readAsDataURL(file);
                    };
                    input.click();
                },                
                content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
            });
        
        
            $("#save").on("click", function(){
                var content = tinymce.activeEditor.getContent();
                console.log(content);
            });
            
        });
        </script>
        
        
<style>
	.container {
	  width: 100%;
	  
	}
	
	.progressbar {
	  counter-reset: step;
	  margin: 5%;
	}
	.progressbar li {
	  list-style: none;
	  display: inline-block;
	  width: 30.33%;
	  position: relative;
	  text-align: center;
	  cursor: pointer;
	}
	.progressbar li:before {
	  content: counter(step);
	  counter-increment: step;
	  width: 30px;
	  height: 30px;
	  line-height : 30px;
	  border: 1px solid blue;
	  border-radius: 100%;
	  display: block;
	  text-align: center;
	  margin: 0 auto 10px auto;
	  background-color: #fff;
	}
	
	.progressbar li:after {
		border: 1px solid blue;
	
	}
	
	.progressbar li:before:eq(2){
	  border: 1px solid red !important;
	}
	
	.progressbar li:after {
	  content: "";
	  position: absolute;
	  width: 100%;
	  height: 1px;
	  background-color: #ddd;
	  top: 15px;
	  left: -50%;
	  z-index : -1;
	}
	.progressbar li:first-child:after {
	  content: none;
	}
	.progressbar li.active {
	  color: blue;
	}
	.progressbar li.active:before {
	  border-color: blue;
	} 
 	.progressbar li.active + li:after {
	  
	}

</style>

<%@ include file="/views/common/footer.jsp" %>