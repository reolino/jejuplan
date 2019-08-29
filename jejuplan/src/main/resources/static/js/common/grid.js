function selGridInit(col){
		
	var  grid = new tui.Grid({
			el: document.getElementById('grid'),
			scrollX: true,
			scrollY: true,
			minBodyHeight: 90,
			rowHeaders: ['rowNum'],
			columns: col
	});
	 
	tui.Grid.applyTheme('striped', {
	row: {
			even: {
				background: '#f3ffe3'
			},
			hover: {
			    background: '#ccc'
			}
		},
	});
		 
	return grid;
}

function getDataRow(grid){
	return	grid.getRow(grid.getFocusedCell().rowKey);
}

function gridReset(grid){
	grid.reloadData();
}
