var grid;
var pagination;
var col;
var search_item;

$(document).ready(function() {
	/*
	 *  searchbar event
	 */
	search_item = [
		{
			label: 'Title',
			name: 'title',
			placeholder: 'input title',
			type: 'input',
			item:''
		},
		{
			label: 'Writer',
			name: 'user_id',
			placeholder: 'input id',
			type: 'input',
			item:''
		},
		{
			label: 'Regist Start',
			name: 'reg_date_start',
			placeholder: 'yy/mm/dd',
			type: 'date',
			item:''
		},
		{
			label: 'Regist End',
			name: 'reg_date_end',
			placeholder: 'yy/mm/dd',
			type: 'date',
			item:''
		}
	
		,{
			label: 'Use',
			name: 'use_yn',
			placeholder: '',
			type: 'select',
			item: [
				{label:'- All -', value:''},
				{label:'use', value:'Y'},
				{label:'not use', value:'N'}
			]
		}
	
	];
	
	searchBarInit(search_item);
	
	/*
	 *  grid event
	 */
	 col = [
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
	
	grid = selGridInit(col);
	
	grid.on('dblclick', function() {
		var rowData = getDataRow(grid);
		var board_no =  rowData.board_no;
	    movePage('/board/detail/view/'+board_no);
	});
	
	/*
	 *  paging event
	 */
	pagination = pagingInit();
	
	calendar = flatpickr(".datepicker",{
		dateFormat: "m/d/y"
	});
});

/*
 *  common searchItem
 */
function searchItem(type){
	var params = $("#iFrm").serialize();
	$.ajax({
		type:"post",
		url : "/board/list/proc/",
		data:params,
		dataType : "json",
		async:false,
		success : function(data){					
			grid.resetData(data.list);
			if(type!='paging'){
				pagination.reset(data.total_cnt);
			}
		},
		error :function(xhr, status, e){
			alert('ajax Failed')
		}
	}); 
}

