var uploader = new tui.FileUploader($('#uploader'), {
     url: {
        send: "/file/upload/proc"
    }, 
    isMultiple: true,
    isBatchTransfer: true,
    listUI: {
        type: 'table',
        columnList: [
            {
                header: '{{checkbox}}',
                body: '{{checkbox}}',
                width: 32
            },
            {
                header: 'File Name',
                body: '<span class="tui-filename-area"><span class="tui-file-name" style="max-width:480px;">{{filename}}</span></span>',
                width: 380
            },
            {
                header: 'File Size',
                body: '{{filesize}}',
                width: 150
            }
        ]
    }
});

var $uploadedCount = $('#uploadedCount');
var $itemTotalSize = $('#itemTotalSize');
var $checkedItemCount = $('#checkedItemCount');
var $checkedItemSize = $('#checkedItemSize');
var $removeButton = $('.tui-btn-cancel');

function disableRemoveButton(state) {
    var className = 'tui-is-disabled';

    if (state) {
        $removeButton.addClass(className);
    } else {
        $removeButton.removeClass(className);
    }

    $removeButton.prop('disabled', state);
}

function updateCheckedInfo(size, count) {
    $checkedItemSize.html(size);
    $checkedItemCount.html(count);
}

function setUploadedCountInfo(count) {
    $uploadedCount.html(count);
}

function resetInfo() {
    $itemTotalSize.html('0 KB');
    $checkedItemSize.html('0 KB');
    $checkedItemCount.html('0');
}

uploader.on('update', function(evt) { 
    var items = evt.filelist;
    var totalSize = uploader.getTotalSize(items);

    $itemTotalSize.html(totalSize);
});

uploader.on('check', function(evt) {
    var checkedItems = uploader.getCheckedList();
    var checkedItemSize = uploader.getTotalSize(checkedItems);
    var checkedItemCount = checkedItems.length;
    var removeButtonState = (checkedItemCount === 0);

    disableRemoveButton(removeButtonState);
    updateCheckedInfo(checkedItemSize, checkedItemCount);
});

uploader.on('checkAll', function(evt) {
    var checkedItems = uploader.getCheckedList();
    var checkedItemSize = uploader.getTotalSize(checkedItems);
    var checkedItemCount = checkedItems.length;
    var removeButtonState = (checkedItemCount === 0);

    disableRemoveButton(removeButtonState);
    updateCheckedInfo(checkedItemSize, checkedItemCount);
});

uploader.on('remove', function(evt) {
    var checkedItems = uploader.getCheckedList();
    var removeButtonState = (checkedItems.length === 0);

    disableRemoveButton(removeButtonState);
    setUploadedCountInfo(0);
    resetInfo();
});

uploader.on('success', function(evt) {
  	var successCount = evt.success;
    var removeButtonState = (successCount > 0);

    $uploadedCount.html(successCount);
    disableRemoveButton(removeButtonState);
    setUploadedCountInfo(successCount);
    resetInfo(); 
    closeFileModal();
});

$removeButton.on('click', function() {
    var checkedItems = uploader.getCheckedList();
    
    uploader.removeList(checkedItems);
});