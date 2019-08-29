<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<script src="/lib/toast_ui/editor/markdown-it.min.js"></script>
<script src="/lib/toast_ui/editor/to-mark.min.js"></script>
<script src="/lib/toast_ui/editor/tui-code-snippet.min.js"></script>
<script src="/lib/toast_ui/editor/codemirror.js"></script>
<script src="/lib/toast_ui/editor/highlight.pack.js"></script>
<script src="/lib/toast_ui/editor/squire-raw.js"></script>
<link rel="stylesheet" href="/lib/toast_ui/editor/codemirror.css">
<link rel="stylesheet" href="/lib/toast_ui/editor/github.css">

<!-- Editor -->
<script src="/lib/toast_ui/editor/tui-editor-Editor.min.js"></script>
<link rel="stylesheet" href="/lib/toast_ui/editor/tui-editor.min.css">
<link rel="stylesheet" href="/lib/toast_ui/editor/tui-editor-contents.min.css">

<!-- table extention -->
<script src="/lib/toast_ui/editor/tui-editor-extTable.min.js"></script>

<!-- uml extention -->
<script src="/lib/toast_ui/editor/plantuml-encoder.min.js"></script>
<script src="/lib/toast_ui/editor/tui-editor-extUML.min.js"></script>

<!-- chart extention -->
<script src="/lib/toast_ui/editor/raphael.min.js"></script>
<!-- 
<script src="/lib/toast_ui/editor/tui-chart-polyfill.min.js"></script>
-->
<script src="/lib/toast_ui/editor/tui-editor-extChart.min.js"></script>
<link rel="stylesheet" href="/lib/toast_ui/editor/tui-chart.min.css">

<!-- colorSyntax extention -->
<script src="/lib/toast_ui/editor/tui-color-picker.min.js"></script>
<script src="/lib/toast_ui/editor/tui-editor-extColorSyntax.min.js"></script>
<link rel="stylesheet" href="/lib/toast_ui/editor/tui-color-picker.css">

<!-- scrollSync extention -->
<script src="/lib/toast_ui/editor/tui-editor-extScrollSync.min.js"></script>

<div id="editSection"></div> 
<input type="hidden" id="content" name="content"> 

<script> 
var editor = new tui.Editor({
    el: document.querySelector('#editSection'),
    previewStyle: 'vertical',
    height: '400px',
    initialEditType: 'markdown',
    useCommandShortcut: true,
    exts: [
      {
        name: 'chart',
        minWidth: 100,
        maxWidth: 600,
        minHeight: 100,
        maxHeight: 300
      },
      'scrollSync',
      'colorSyntax',
      'uml',
      'mark',
      'table'
    ]
});

editor.on('blur', function() {
	$("#content").val(editor.getHtml());
});

</script> 




