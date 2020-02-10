/**
 * Created by CoderQiang on 2017/5/18.
 */
var UserMessage=function () {
    var _self="";
    return {
        page: 1,
        totalPage:0,
        isPagination: false,
        init:function () {
            _self=this;
            _self.messageList();
        },messageList:function () {
            $.post(window.apppath+"/view/api/user/getMessageList",{
                pageNum: _self.page,
                length:5
            },function (res) {
                if(res.success)
                {
                    var html="";
                    $("#messageCount").html(res.data.count);
                    if(res.data.totalPage==0)
                    {
                        html="<p colspan='5' style='text-align: right'>无数据</p>";
                        $("#messageDiv").html(html);
                    }
                    else {
                        var messages = res.data.messages;
                        _self.totalPage = res.data.totalPage;
                        for(var i in messages)
                        {
                            var content=messages[i].content;
                            content=eval("("+content+")");
                            html+=[' <div class="alert_box">',
                                '                    <div class="alert_con info">',
                                '                        <div class="alert_hd">',
                                '                            <h2 class="lf">'+messages[i].title+'</h2>',
                                '                            <a href="" class="rt close">×</a>',
                                '                        </div>',
                                '                        <div class="alert_bd">',
                                '                            <p class="alert_text">'+content.content+'</p>',
                                '                        </div>',
                                '                    </div>',
                                '                    <p class="time">'+messages[i].createTime+'</p>',
                                '                </div>'].join("");
                        }
                        $("#messageDiv").html(html);
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
                                        _self.messageList();
                                    }
                                }
                            });
                            _self.isPagination = true;
                        }
                    }
                }

            },'json');
        }
    }
}();