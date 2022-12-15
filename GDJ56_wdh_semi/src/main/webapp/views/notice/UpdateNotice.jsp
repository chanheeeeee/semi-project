<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.wdh.notice.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>


<%@ include file="/views/common/adminHeader.jsp" %> 


 <div style="background-image:url('<%=request.getContextPath()%>/images/backback.png')">
        
        
        <section id="notice-container">
                <h2><strong>글 수정하기</strong></h2>
            <form action="" method="post" enctype="multipart/form-data">
                <table id="tbl-board" border="1">
                <tr>
                    <th>제 목</th>
                    <td>
                        &nbsp;&nbsp;<input type="text" placeholder="제목입력" value="<%=n.getNoticeTitle() %>">
                        
                    </td>
                </tr>
                <tr>
                    <th>작 성 자</th>
                    <td>
                        &nbsp;&nbsp;<input type="text" name="notice_writer" placeholder="작성자입력" value="관리자" readonly >
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <th>내 용</th>
                    <td colspan="3" style="text-aligin: ceter;">
                    <form method="post">
                    	<textarea name="board_content" id="editor"><%=n.getNoticeContent()%></textarea>
                        <!-- <textarea name="board_content" id="editor"></textarea> -->
                    </form>
                </td>
                </tr>
            </table>
            <tr>
	            <th colspan="2">
	                <input type="submit" value="수정하기" onclick="">
	            </th>
        	</tr>
            <div>
    		<input type="hidden" name="noticeNo" value ="<%=n.getNoticeNo()%>">
    		</div>
            </form>
            
        </section>
        <br>
        </div>
        
        <script>
		const noticeCheck = () => {
		if($("[name=noticeTitle]").val() == ""){
			alert("제목을 입력해 주세요!!");
			return false;
		}
		
		else if($("[name=noticeContent]").val() == ""){
			alert("내용 입력해 주세요!!");
			return false;
		}
	}
	</script>
		
		<!-- 웹에디터  -->
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
		                /*** image upload ***/
		                
		                content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
		            });
		        
		            $("#save").on("click", function(){
		                var content = tinymce.activeEditor.getContent();
		                
		            });
		            
		        });
		</script>