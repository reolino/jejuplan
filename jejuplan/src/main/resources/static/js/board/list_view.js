$(document).ready(function() {
	
	var grid = '';
	var col = [
		{
			header: 'Title',
			name: 'title'
		},
		{
			header: 'Writer',
			align: 'center',
			name: 'reg_user_id'
		},
		{
			header: 'RegDate',
			align: 'center',
			name: 'reg_date'
		}
	];
	
	grid = selGridMake(col);
	
	grid.on('dblclick', function() {
		var rowData = getDataRow(grid);
		var board_no =  rowData.board_no;
	    movePage('/board/detail/view/'+board_no);
	});
});