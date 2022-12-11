<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
    <table id="step">
        <tr>
            <td id="step1" style="background-color: lightgray;">step1. 작성자 평가</td>
            <td style="background-color: rgba(0, 136, 255, 0.297);">step2. 후기 작성</td>
            <td style="background-color: lightgray;">step3. 작성완료</td>
        </tr>
    </table>


    <table id="info">
        <tr>
            <th>참여동행</th>
            <td>정보가져오기~~</td>
            <th>동행자 닉네임</th>
            <td>정보가져오기~~</td>
        </tr>
        <tr>
            <th>참여날짜</th>
            <td>정보가져오기~~</td>
            <th>운동종목</th>
            <td>정보가져오기~~</td>
        </tr>
    </table>
    <br><br><br>
    <table id="writeTable2">
        <tr>
            <th colspan="4" style="text-align: center;">
                제목   <input type="text" id="title_input"><br>
            </th>
        </tr>
        <tr>
            <th></th>
            <td colspan="3" style="text-align: center;">
                <form method="post">
                    <textarea id="editor"></textarea>
                </form>
            </td>
        </tr>
        <tr>
            <th></th>
            <th colspan="4">
                <div class="wrap" style="margin: 5%;">
                    <button class="button">등록</button>
                </div>

            </th>
        </tr>
    </table>

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