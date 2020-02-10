/**
 * Created by CoderQiang on 2017/5/16.
 */
var UserTaskList=function () {
    var _self="";
    return {
        page: 1,
        totalPage:0,
        isPagination: false,
        init:function () {
            _self=this;
            _self.taskList(2);
            $("#indent_nav li a").click(function () {
                if(!$(this).parent().hasClass("active"))
                {
                    $("#indent_nav li").removeClass("active");
                    $(this).parent().addClass("active");
                    var status=$(this).attr("data");
                    if(_self.isPagination)
                    {
                        $('#pagination').jqPaginator('destroy');
                        _self.page=1;
                        _self.isPagination=false;
                    }
                    _self.page=1;
                    _self.taskList(status);
                }
            })
        },
        taskList:function (status) {
            $.post(window.apppath+"/view/api/task/getTaskList",{
                pageNum: _self.page,
                status:status
            },function (res) {
                if(res.success)
                {
                    var html="";
                    if(res.data.totalPage==0)
                    {
                        html="<tr><td colspan='5' style='text-align: right'>无数据</td></tr>";
                        $("#listTbody").html(html);
                    }
                    else {
                        var tasks = res.data.tasks;
                        _self.totalPage = res.data.totalPage;
                        for(var i in tasks)
                        {
                            var task=tasks[i];
                            var strs = ["已拒绝", "待响应", "组织已响应", "组织已派遣", "组织已拒绝", "服务人员已接单", "服务人员已上门", "服务人员已拒绝", "待付款","已完成", "已评价", "已调度"];
                            html+=['<tr>',
                                '                            <td colspan="5">',
                                '                                <table>',
                                '                                    <thead>',
                                '                                    <tr>',
                                '                                        <td colspan="4">订单时间：'+task.createTime+'</td>',
                                '                                        <td colspan="2">订单号：'+task.number+'</td>',
                                '                                    </tr>',
                                '                                    </thead>',
                                '                                    <tbody>',
                                '                                    <tr>',
                                '                                        <td width="200px">',
                                ''+task.serviceType+'，'+task.serviceName,
                                '                                        </td>',
                                '                                        <td>',
                                '                                            <p>'+task.elderName+' </p>',
                                '                                            <a href="'+window.apppath+'/user/update_linkElder.html/'+task.elderId+'" class="table_btn">修改资料</a>',
                                '                                        </td>',
                                '                                        <td>',
                                // '                                            <span>总额 ￥240.00</span>',
                                // '                                            <h6>实付 <br/>￥240.00 </h6>',
                                // '                                            <hr style="border-top: #d8d8d8"/>',
                                // '                                            <span>在线支付</span>',
                                '                                            <span>暂无金额</span>',
                                '                                        </td>',
                                '                                        <td>',
                                '                                            <span class="color_warn">'+strs[task.status]+'</span>',
                                '                                            <a href="'+window.apppath+'/user/task_info.html/'+task.id+'">订单详情</a>',
                                '                                        </td>',
                                '                                        <td>',
                                '                                            <span>服务时间</span>',
                                '                                            <span>'+task.serviceTime+'</span>',
                                // '                                            <a href="" class="table_btn active">'+strs[task.status]+'</a>',
                                '                                        </td>',
                                '                                    </tr>',
                                '                                    </tbody>',
                                '                                </table>',
                                '                            </td>',
                                '                        </tr>'].join("");
                        }
                        $("#listTbody").html(html);
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
                                        _self.taskList(status);
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