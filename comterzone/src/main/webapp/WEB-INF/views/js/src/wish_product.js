	function WishProduct( ProductNo, wish_type ){
		var ProductOption = '';

		if( document.getElementById('AddInkTonerCount')!=null){
			for(var it=0; it < document.getElementById('AddInkTonerCount').value; it++){
				if(document.getElementById('InkToner_' + it).checked == true){
					ProductOption += document.getElementById('InkToner_' + it).value + "|";
				}
			}
		}
		if(wish_type == 'Normal'){
			var AddPr = '';
			var AddEa = '';
			window_open('../pop_page/wishlist_popup1.htm?actype=addToProduct&ProductNo='+ ProductNo+ '&WishType=Normal&Ea=1&ProductOption='+ProductOption,532,570,'scrollbars=no','Wish');
		}else if(wish_type == 'Option'){
			var AddPr = '';
			var AddEa = '';

			var item_count = $("input[name='add_PGNo_ProductNo_Arr[]']").size();

			if(item_count){
				$("input[name='add_PGNo_ProductNo_Arr[]']").each(function(index){
					if(!AddPr){
						AddPr += $(this).val();
						AddEa += '1';
					}else{
						AddPr += "|"+$(this).val();
						AddEa += "|"+1;
					}

				})
				//묶음상품 기존 Normal로 던져서 1대표상품만 들어가던것 -> option으로 변경 하여 선택한 제품 모두 들어가게 2019-07-15 오전 9:28:36 kbjin44 
				if(AddPr) ProductOption = AddPr;
			}else{
				AddPr += ProductNo;
				AddEa += 1;
			}

			window_open('../pop_page/wishlist_popup1.htm?actype=addToProduct&ProductNo='+ ProductNo+ '&WishType=Normal&Ea='+AddEa+'&ProductOption='+ProductOption,483,527,'scrollbars=no','Wish');
		}else{
			window_open('../pop_page/wishlist_popup1.htm?actype=addToProduct&ProductNo='+ ProductNo+ '&WishType=Normal&Ea=1&ProductOption='+ProductOption,483,527,'scrollbars=no','Wish');
		}

	}
