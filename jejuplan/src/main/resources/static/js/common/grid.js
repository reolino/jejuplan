function selGridMake(col){
	var dataSource = {
	  api: {
	      readData: { url: '/board/list/proc', method: 'GET' },
	      createData: { url: '/api/create', method: 'POST' },
	      updateData: { url: '/api/update', method: 'PUT' },
	      deleteData: { url: '/api/delete', method: 'DELETE' },
	      modifyData: { url: '/api/modify', method: 'POST' }
	  }
	}
		
	var  grid = new tui.Grid({
			el: document.getElementById('grid'),
			data: dataSource,
			scrollX: true,
			scrollY: true,
			minBodyHeight: 90,
			rowHeaders: ['rowNum'],
			pageOptions: {
				perPage: 10
			},
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