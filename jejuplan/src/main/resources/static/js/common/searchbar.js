var choices = null;
var calendar = null;
var select_enable = false;
var group = [];

/*
 * init searchbar  
 */
function searchBarInit(data){
	$("[name=menu_id]").val($("#p_menu_id").val())

	var row_str = '';
	var cnt = data.length;

	if(cnt>0){
		for(var i=0; i<cnt/4 ;i++){
			row_str +='<div class="s_row" id="s_row_'+i+'"></div>';
		}
	}
	
	row_str +='<hr>';
	row_str +='<div class="s_row last" style="justify-content: center;">';
	row_str +='		<button class="btn-search" type="button" name="resetBtn" style="background:#dc3545">Reset</button>';
	row_str +='		<button class="btn-search" type="button" name="searchBtn" style="margin-left:10px">Search</button>';
	row_str +='</div>';
	
	$("#main-form").html(row_str);
	
	for(var j=0; j<cnt ;j++){
		var item_str = '';

		var idx = Math.floor(j / 4) ;
		item_str = makeItem(data[j]); 
		$("#s_row_"+idx).append(item_str);
	}
	
	if(select_enable){
		choices = new Choices('[data-trigger]',{
			searchEnabled: false,
		    itemSelectText: '',
		});
	}
	
	/*
	 * button setting 
	 */ 
	var btnTypes = document.querySelectorAll('.travel-type-wrap .item')

	for (var i = 0; i < btnTypes.length; i++){
		btnTypes[i].addEventListener('click', function(){
			for (let i = 0; i < btnTypes.length; i++) {
				btnTypes[i].classList.remove('active');
		    }
		    btnTypes[i].classList.add('active');
		})
	}
	
	/*
	 * calendar setting 
	 */ 
	var calendar = flatpickr(".datepicker",{
		dateFormat: "m/d/y"
	});
	
	/*
	 *  search event
	 */
	$('[name=searchBtn]').click(function(){
		searchItem();
	});
	
	/*
	 *  reset event
	 */
	$('[name=resetBtn]').click(function(){
		resetItem();
	});
}

/*
 * make searchbar field 
 */
function makeItem(data){
	var str = '';

	group.push(data.name);
	
	if(data.type =='input'){
		str += '<div class="input-wrap">';
		str += '	<div class="input-field">';
		str += '		<label>'+data.label+'</label>';
		str += '		<div class="icon-wrap">';
		str += '			<i class="fa fa-search"></i>';
		str += '		</div>';
		str += '		<input type="text" name="'+data.name+'" id="'+data.name+'" placeholder="'+data.placeholder+'" />';
		str += '	</div>';
		str += '</div>';
	}else if(data.type =='date'){
		str += '<div class="input-wrap">';
		str += '	<div class="icon-wrap">';
		str += '		<i class="fa fa-calendar-o"></i>';
		str += '	</div>';
		str += '	<div class="input-field">';
		str += '		<label>'+data.label+'</label>';
		str += '		<input class="datepicker" type="text" name="'+data.name+'" id="'+data.name+'" placeholder="'+data.placeholder+'" />';
		str += '	</div>';
		str += '</div>';
		
	}else if(data.type =='select'){
		var item = data.item;
		
		str += '<div class="input-wrap">';
		str += '	<div class="icon-wrap">';
		str += '		<i class="fa fa-search"></i>';
		str += '	</div>';
		str += '	<div class="input-field">';
		str += '		<label>'+data.label+'</label>';
		str += '		<div class="input-select">';
		str += '			<select data-trigger="" name="'+data.name+'" id="'+data.name+'">';
		for(var k=0; k<item.length ;k++){
			str += '			<option value="'+item[k].value+'">'+item[k].label+'</option>';
		}
		str += '			</select>';
		str += '		</div>';
		str += '	</div>';
		str += '</div>';
		
		select_enable = true;
	}
	
	return str;
}

/*
 * searchbar reset
 */
function resetItem(){
	for(var i=0;i<group.length;i++){
		$("[name="+group[i]+"]").val('')
	}
	// select box not reset
}

/*
 * calendar destory 
 */
function calendarDestroy(){
	if(calendar != null){
		for(var i=0 ; i<calendar.length ;i++){
			if(calendar[i] != null){
				calendar[i].destroy();
			} 
		}
	}
}


