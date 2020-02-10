/**
 * Created by Administrator on 2016/11/8.
 */
var GoodsList=function () {
    
    var _self="";
    return {
        page: 1,
        isPagination: false,
        goodsId:"",
        init:function (id) {
            _self=this;
            _self.goodsId=id;
            _self.getList();
        },
        getList:function () {
            $.post(window.apppath + "/goods/api/list",{
                    moduleId:_self.moduleId,
                    page: _self.page,
                    length:5
            },function (res) {
                if (res.success) {
                    var html="";
                    if(_self.totalPage==0)
                    {
                        $('#pagination').jqPaginator('destroy');
                        html="无数据";
                    }
                    else {
                        var infos = res.data.infos;
                        $(".moduleName").html(infos[0].module);
                        $("title").html(infos[0].module);
                        _self.totalPage = res.data.totalPage;
                        for(var i in infos)
                        {
                            var url=infos[i].pic;
                            if(url==""||url==null)
                                url=window.apppath+'/assets/view/images/no_image.jpg';
                            html+='<li>'+
                             '<img src="'+url+'" alt="" />'+
                            '<div style="margin-left: 20px;vertical-align:top">'+
                            '<h4><a href="'+window.apppath+'/goods/'+infos[i].id +'">'+infos[i].name+'</a></h4>'+
                            '<P style="height: 20px; overflow: hidden">价格：¥'+
                            infos[i].price+
                            '元</P>'+
                            '<p style="height: 20px; overflow: hidden"><span>售量：12</span></p>'+
                            '</div>'+
                            '</li>';
                        }
                        $(".news_list_con_ul").html(html);
                    }

                    if (!_self.isPagination && _self.totalPage >= 1) {
                        _self.pagination= $.jqPaginator('#pagination', {
                            totalPages:   _self.totalPage,
                            visiblePages: 5,
                            currentPage: _self.page,
                            first: '<li class="first"><a href="javascript:void(0);">首页<\/a><\/li>',
                            prev: '<li class="prev"><a href="javascript:void(0);"><i class="arrow arrow2"><\/i>上一页<\/a><\/li>',
                            next: '<li class="next"><a href="javascript:void(0);">下一页<i class="arrow arrow3"><\/i><\/a><\/li>',
                            last: '<li class="last"><a href="javascript:void(0);">末页<\/a><\/li>',
                            page: '<li class="page"><a href="javascript:void(0);">{{page}}<\/a><\/li>',
                            onPageChange: function (num, type) {
                                _self.page = num;
                                if (type != 'init') {
                                    _self.getList();
                                }
                            }
                        });
                        _self.isPagination = true;
                    }
                }
            },"json");
        }
    }
}();