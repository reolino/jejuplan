$(document).ready(function() {
	$('#uploadBtn').click(function (e) {
		e.preventDefault();
		$('#files').click();
	});
});

function changeValue(obj){
	$('#fileNm').val(obj.value);
}