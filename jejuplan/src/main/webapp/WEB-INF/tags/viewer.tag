<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!-- Viewer Dependencies -->
<script src="/lib/toast_ui/editor/markdown-it.min.js"></script>
<script src="/lib/toast_ui/editor/tui-code-snippet.min.js"></script>
<script src="/lib/toast_ui/editor/highlight.pack.js"></script>
<link rel="stylesheet" href="/lib/toast_ui/editor/github.css">

<!-- Viewer -->
<script src="/lib/toast_ui/editor/tui-editor-Viewer.min.js"></script>
<link rel="stylesheet" href="/lib/toast_ui/editor/tui-editor-contents.min.css">

<!-- table extention -->
<script src="/lib/toast_ui/editor/to-mark.min.js"></script>
<script src="/lib/toast_ui/editor/tui-editor-extTable.min.js"></script>
<!-- uml extention -->
<script src="/lib/toast_ui/editor/plantuml-encoder.min.js"></script>
<script src="/lib/toast_ui/editor/tui-editor-extUML.min.js"></script>

<div id="editSection" style="border: 1px solid #e9ecef;padding: 5px"></div>

<script>
var content = [
	$("#content").val()
].join('\n');

var editor = new tui.Editor({
  el: document.querySelector('#editSection'),
  height: '300px',
  initialValue: content,
  exts: ['table', 'uml']
});
</script>

