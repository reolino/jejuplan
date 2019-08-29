function pagingInit(){
	var pagination = new tui.Pagination('pagination', {
	    totalItems: 0,
	    itemsPerPage: 10,
	    visiblePages: 10
	});
	
	pagination.on('beforeMove', function(eventData) {
		$("[name=page]").val(eventData.page);
		searchItem('paging');
	    return eventData.page;
	});
	
	pagination.on('afterMove', function(eventData) {
		$("[name=page]").val(eventData.page);
		searchItem('paging');
	    return eventData.page;
	});
	
	return pagination;
}

