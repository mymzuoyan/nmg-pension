var SystemRole = function () {
    var handleList = function (method) {

        var container = $("#divContainer");
        function loadRoles(){
            showBlockUI();
            $.post(window.apppath + "/admin/api/sysrole/getList",{
                orderField:"level",
                orderDir:"ASC"
            }, function (res) {
                Metronic.unblockUI(container);
                if (res) {
                    var resList = res.data;
                    var option='<option value="-1">请选择</option>';
                    for(var i=0;i<resList.length;i++){
                        option += '<option value="'+ resList[i].id +'">'+ resList[i].name+'</option>';
                    }

                    $("#selectRoles").html(option);

                }
            }, 'json');
        }

        function showBlockUI(){
            Metronic.blockUI({
                message: '处理中...',
                target: container,
                overlayColor: 'none',
                cenrerY: true,
                boxed: true
            });
        }
        function showMetroMessage(messageContent) {
            Metronic.alert({
                type: 'danger',
                icon: 'warning',
                message: messageContent,
                container: tableContainer,
                place: 'prepend'
            });
        }

        /**
         * 获取权限树
         */
        $('#jstree_demo').jstree({
            'plugins': ["checkbox","wholerow"],
            "core" : {
                "multiple":true,
                "animation" : 0,
                "check_callback" : true,
                "themes" : { "stripes" : true },
                'data' : {
                    'url' : function (node) {
                        return window.apppath+'/admin/api/permission/list';
                    },
                    'data' : function (node) {
                        return { 'id' : node.id };
                    },
                    'dataType':'json'
                }
            },
            "checkbox" : {
                "keep_selected_style" : false
            },
            "types" : {
                "root" : {
                    "icon" : "https://www.jstree.com/static/3.3.1/assets/images/tree_icon.png",
                    "valid_children" : ["default"]
                },
                "default" : {
                    "icon" : "fa fa-folder icon-state-warning icon-lg",
                    draggable : false  //设置节点不可拖拽
                },
                "file" : {
                    "icon" : "fa fa-file icon-state-warning icon-lg"
                }
            }
        });

        /**
         * 添加角色
         */
        $('#btnSubmit').click(function(){
            var roleName = $("#roleName").val();
            if(!roleName){
                return;
            }
            var $btn = $(this);
            $btn.button('loading');
            $.post(window.apppath + "/admin/api/sysrole/add",
                {name:roleName}, function(res) {
                    $btn.button('reset');
                    if (res.success) {
                        $("#roleName").val('');
                        loadRoles();
                    } else {
                        alert(res.message);
                    }
                }, "json");
        });

        /**
         * 展示角色对应的权限
         */
        $("#selectRoles").change(function(){
            var _v = $(this).val();
            if(_v!=-1){
                getRolePermissions(_v);
            }
        });
        function getRolePermissions(roleId){
            showBlockUI();
            $.post(window.apppath + "/admin/api/sysrole/perms",
                {roleId:roleId}, function(res) {
                    Metronic.unblockUI(container);
                    if (res) {
                        //只展示叶节点,父节点自动半选或全选
                        var node_leafs = new Array();
                        for(var k=0;k<res.data.length;k++){
                            console.log(res.data[k].permissionId);
                            var n = $('#jstree_demo').jstree('get_node',res.data[k].permissionId);
                            console.log(n);
                            var is_leaf =$('#jstree_demo').jstree('is_leaf',n);
                            if( is_leaf){
                                node_leafs.push(n);
                            }
                        }
                        $('#jstree_demo').jstree('uncheck_all');
                        $('#jstree_demo').jstree('check_node',node_leafs);
                    }else{
                        alert('系统异常');
                    }
                }, "json");
        }

        /**
         * 保存角色新权限
         */
        $('#btnSave').click(function(){
            var $btn = $(this);
            var node_checked = $('#jstree_demo').jstree('get_checked');//默认返回节点id,传full返回节点对象

            var allNodes = [];
            for(var i=0;i<node_checked.length;i++){

                var sel_node = $('#jstree_demo').jstree('get_node',node_checked[i]);
                //添加选中节点
                allNodes.push(sel_node.id);
                var is_leaf =$('#jstree_demo').jstree('is_leaf',sel_node);
                if(is_leaf){
                    //添加选中节点的所有父节点
                    var sel_node_parents = sel_node.parents;
                    allNodes = allNodes.concat(sel_node_parents);
                }

            }
            if(allNodes.length==0){
                return;
            }
            // 节点去重
            var uniqueNodes = uniqueNodeIds(allNodes);
            $btn.button('loading');
            $.post(window.apppath + "/admin/api/sysrole/updatePerms",
                {roleId:$('#selectRoles').val(),perms:uniqueNodes.join(',')}, function(res) {
                    $btn.button('reset');
                    $("#btnSaveMsg").text(res.message);
                }, "json");
        });

        /**
         * 节点去重
         * @param arr
         * @returns {Array}
         */
        function uniqueNodeIds(arr) {
            var result = [], hash = {};
            for (var i = 0, elem; (elem = arr[i]) != null; i++) {
                if (!hash[elem]) {
                    result.push(elem);
                    hash[elem] = true;
                }
            }
            return result;
        }
        /**
         * 调用加载角色
         */
        loadRoles();
    }


    return {
        //main function to initiate the module
        init: function (method) {
            handleList(method);
        }
    };

}();