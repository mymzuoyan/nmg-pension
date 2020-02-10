//通用选项卡js
$(function(){
    function tabs(tabTit,on,tabCon){
        $(tabTit).children().click(function(){
            $(this).addClass(on).siblings().removeClass(on);
            var index = $(tabTit).children().index(this);
           	$(tabCon).children().eq(index).show().siblings().hide();
    	});
	};
    tabs(".tab_tit","act2",".info2");//选项卡1
    tabs(".tab_tit3","act3",".info3");//选项卡2
});
