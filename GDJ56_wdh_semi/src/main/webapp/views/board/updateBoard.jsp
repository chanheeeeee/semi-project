<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.board.vo.*" %>
<% Board b = (Board)request.getAttribute("board"); %>
<%@ include file="/views/common/header.jsp" %>

<div id="write-container">
    <form action="<%=request.getContextPath() %>/board/boardupdateend.do?wd_no=<%=b.getWdNo() %>" method="post">
		<div class="wrap" style="margin-top: 3%;">
			<select name="type" id="button1" onchange="selectValue()">
				<option value="종목선택" style="text-align: center;">종목선택</option>
				<option value="구기" selected="<%=b.getWdPurpose().equals("구기")?"selected":""%>"> 구기 (축구, 야구 테니스 등)</option>
				<option value="유산소" selected="<%=b.getWdPurpose().equals("유산소")?"selected":""%>"> 유산소 (등산, 자전거, 걷기 등)</option>
				<option value="수상" selected="<%=b.getWdPurpose().equals("수상")?"selected":""%>"> 수상 (수영, 서핑 등)</option>
				<option value="기타" selected="<%=b.getWdPurpose().equals("구기")?"selected":""%>"> 기타</option>
			</select>  
			
			<!-- <form name="form" id="form" method="post"> -->
				<input type="button" onClick="goPopup();" class="button1" value="<%=b.getWdLocation() %>">
				<div id="list"></div>
				<div id="callBackDiv">
					<table>
						<tr><td></td><td><input type="hidden"  style="width:500px;" id="roadFullAddr"  name="roadFullAddr" value="<%=b.getWdLocation() %>"/></td></tr>
					</table>
				</div>
			<!-- </form> -->

			<script>
				const goPopup=()=>{
					var pop=window.open("<%=request.getContextPath()%>/board/map.do","pop","width=700,height=550, scrollbars=yes, resizable=yes");
				}
				function jusoCallBack(roadFullAddr){
					/* document.form.roadFullAddr.value = roadFullAddr; */
					document.getElementById("roadFullAddr").value=roadFullAddr
				}
			</script>                    
			<input type="number" name="count" id="button1" placeholder="모집인원" value="<%=b.getWdCount()%>" min="1">      
			<input class="button1" name="date" id="datepicker" value="<%=b.getWdDate()%>">
			<script>
				$('#datepicker').datepicker("getDate");
			</script> 
		</div>

		<table id="radio" style="margin:auto; width: 600px;">
			<tr>
				<th style="font-size: 13px;">성별</th>
				<td>
					&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="여" <%=b.getWdGender().equals("F")?"checked":"" %>>  여
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="남" <%=b.getWdGender().equals("M")?"checked":"" %>>  남
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="무관" <%=b.getWdGender().equals("A")?"checked":"" %>>  무관
				</td>
				<th>목적</th>
				<td>
					&nbsp;&nbsp;<input type="radio" name="purpose" value="취미" <%=b.getWdPurpose().equals("취미")?"checked":"" %>>  취미
					&nbsp;&nbsp;<input type="radio" name="purpose" value="친목" <%=b.getWdPurpose().equals("친목")?"checked":"" %>>  친목
					&nbsp;&nbsp;<input type="radio" name="purpose" value="다이어트" <%=b.getWdPurpose().equals("다이어트")?"checked":"" %>>  다이어트
					&nbsp;&nbsp;<input type="radio" name="purpose" value="건강" <%=b.getWdPurpose().equals("건강")?"checked":"" %>> 건강    
				</td>
			</tr>
		</table>
        <div><br>
        	<table id="writeTable2">
        		<tr>
            		<th colspan="4" style="text-align: center;">
                		제목   <input type="text" name="board_title" id="title_input" value="<%=b.getWdTitle()%>"><br>
            		</th>
        		</tr>
        		<tr>
            		<th></th>
            		<td colspan="3" style="text-align: center;">
                		<div id="summernote"></div>
                			<form method="post">
                    			<textarea name="board_content" id="editor"><%=b.getWdContent()%></textarea>
                			</form>
            		</td>
				</tr>
        		<tr>
            		<th></th>
            		<th colspan="4">
                		<div class="wrap" style="margin: 5%;">
                    	<input type="submit" class="button" value="수정">
                		</div>
            		</th>
        		</tr>
    		</table>
 		</div>
 	</form>
 </div>

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
                
                /*** image upload ***/
                image_title: true,
                /* enable automatic uploads of images represented by blob or data URIs*/
                automatic_uploads: true,
                /*
                    URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
                    images_upload_url: 'postAcceptor.php',
                    here we add custom filepicker only to Image dialog
                */
                file_picker_types: 'image',
                /* and here's our custom image picker*/
                file_picker_callback: function (cb, value, meta) {
                    var input = document.createElement('input');
                    input.setAttribute('type', 'file');
                    input.setAttribute('accept', 'image/*');
        
                    /*
                    Note: In modern browsers input[type="file"] is functional without
                    even adding it to the DOM, but that might not be the case in some older
                    or quirky browsers like IE, so you might want to add it to the DOM
                    just in case, and visually hide it. And do not forget do remove it
                    once you do not need it anymore.
                    */
                    input.onchange = function () {
                        var file = this.files[0];
        
                        var reader = new FileReader();
                        reader.onload = function () {
                            /*
                            Note: Now we need to register the blob in TinyMCEs image blob
                            registry. In the next release this part hopefully won't be
                            necessary, as we are looking to handle it internally.
                            */
                            var id = 'blobid' + (new Date()).getTime();
                            var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
                            var base64 = reader.result.split(',')[1];
                            var blobInfo = blobCache.create(id, file, base64);
                            blobCache.add(blobInfo);
        
                            /* call the callback and populate the Title field with the file name */
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
                console.log(content);
            });
            
        });
        </script>




<%@ include file="/views/common/footer.jsp" %>