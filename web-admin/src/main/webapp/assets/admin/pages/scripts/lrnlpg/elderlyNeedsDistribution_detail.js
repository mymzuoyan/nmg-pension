var ElderlyNeedsDistributionDetail = function () {
    var _method;


    return {
        //main function to initiate the module
        init: function () {
            $("#serviceOrg-form").find("input:text").prop("disabled", true);//找到form表单下的所有input标签并置为可编辑

        },
        allowEdit: function () {
            $("#serviceOrg-form").find("input:text").prop("disabled", false);//找到form表单下的所有input标签并置为可编辑
        },
        submitEdit: function () {
            var id = $("input[name=id]").val();
            var status = $("input[name=status]").val();
            var title = $("input[name=title]").val();
            var context = $("input[name=context]").val();
            var publisher = $("input[name=publisher]").val();
            var releaseTime = $("input[name=releaseTime]").val();
            var serviceOrgName = $("input[name=serviceOrgName]").val();
            if(title=="" || title==null){
                $("#labelmsg").text('标题不能为空！').addClass("label-danger");
                return;
            }else if(context=="" || context==null){
                $("#labelmsg").text('需求内容不能为空！').addClass("label-danger");
                return;
            }else if(publisher=="" || publisher==null){
                $("#labelmsg").text('发布人不能为空！').addClass("label-danger");
                return;
            }else if(releaseTime=="" || releaseTime==null){
                $("#labelmsg").text('发布时间不能为空！').addClass("label-danger");
                return;
            }else if(serviceOrgName=="" || serviceOrgName==null){
                $("#labelmsg").text('组织名称不能为空！').addClass("label-danger");
                return;
            } else {
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/org/sojournManage/ElderlyNeedsDistributionUpdate?id=" + id + "&title="
                    + title + "&context=" + context + "&publisher=" + publisher + "&releaseTime=" + releaseTime
                    + "&serviceOrgName=" + serviceOrgName + "&status=" + status,
                    dataType: "json",
                    success: function (res) {
                        if (res.success) {
                            alert(res.message);
                            window.location.reload();
                        } else {
                            alert(res.message);
                        }
                    }
                });
            }
        }
    };
}();