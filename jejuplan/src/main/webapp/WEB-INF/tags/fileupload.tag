<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%> 
<link rel="stylesheet" type="text/css" href="/lib/toast_ui/file_upload/tui-file-uploader.css" />
<link rel="stylesheet" type="text/css" href="/lib/toast_ui/file_upload/service.css" />
<div id="uploader" class="tui-file-uploader">
    <div class="tui-file-uploader-header">
        <span class="tui-file-uploader-tit">File Uploader</span>
        <span class="tui-file-upload-msg"><span id="uploadedCount">0</span> files successfully uploaded</span>
        <div class="tui-btn-area">
            <button type="button" class="tui-btn tui-btn-cancel tui-is-disabled" disabled>Remove</button>
            <label class="tui-btn tui-btn-upload">
                <span class="tui-btn-txt">Add files</span>
                <input type="hidden" id="menu_id" name="menu_id" value="">
                <input type="hidden" id="board_no" name="board_no" value="${board_no}">
                <input multiple="multiple" type="file" name="filelist" class="tui-input-file">
            </label>
        </div>
    </div>
    <div class="tui-js-file-uploader-list tui-js-file-uploader-dropzone tui-file-uploader-area tui-has-scroll">
        <div class="tui-dropzone-contents">
            <span class="tui-dropzone-msg">Drop files here.</span>
        </div>
    </div>
    <div class="tui-file-uploader-info">
        <span class="tui-info-txt">Selected <em class="tui-spec"><span id="checkedItemCount">0</span> files</em> (<span id="checkedItemSize">0 KB</span>)</span>
        <span class="tui-info-txt">Total <span id="itemTotalSize">0 KB</span></span>
    </div>
    <div class="tui-btn-submit">
        <button type="submit" class="tui-btn tui-btn-large">Upload</button>
    </div>
</div>
<script type="text/javascript" src="/lib/toast_ui/file_upload/tui-code-snippet.min.js"></script>
<script type="text/javascript" src="/lib/toast_ui/file_upload/tui-file-uploader.min.js"></script>
<script type="text/javascript" src="/js/common/fileupload.js" ></script>
<script type="text/javascript" src="/js/common/file.js" ></script>



