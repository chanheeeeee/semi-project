<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
 <div style="background-image:url('<%=request.getContextPath()%>/images/backback.png')">
        <section id="notice-container">
                <h2><strong>공지사항 글 작성</strong></h2>
            <form action="" method="post" enctype="multipart/form-data">
                <table id="tbl-board" border="1">
                <tr>
                    <th>제 목</th>
                    <td>
                        &nbsp;&nbsp;<input type="text" placeholder="제목입력" name="notice-title">
                    </td>
                </tr>
                <tr>
                    <th>작 성 자</th>
                    <td>
                        &nbsp;&nbsp;<input type="text" name="notice_writer" placeholder="작성자입력" value="관리자" readonly >
                    </td>
                </tr>
                <tr>
                    <th>첨 부 파 일</th>
                    <td>
                        &nbsp;&nbsp;<input type="file" name="upfile">
                    </td>
                </tr>
                <tr>
                    <th>내 용</th>
                    <td>
                    <form method="post">
                        <textarea id="editor"></textarea>
                    </form>
                </td>
                </tr>
                <!-- <tr>
                    <th colspan="2">
                        <input type="button" value="수정하기" onclick="">
                        <input type="button" value="삭제하기" onclick="">
                    </th>
                </tr> -->
            </table>
            <button onclick="location.replace='<%=request.getContextPath() %>/views/notice/notice.jsp'">등록</button>
            </form>
            
        </section>
        <br>
        </div>


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

<%@ include file="/views/common/footer.jsp" %>