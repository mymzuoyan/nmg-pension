var SystemPermission = function () {

    function initTree() {

        var _sel_node_id;
        var _sel_node_name;
        var Container = $('#juiContainer');
        $('#jstree_demo').jstree({
            'plugins': ["wholerow", "types"],
            "core": {
                'data': {
                    'url': function (node) {
                        return window.apppath + '/admin/api/permission/list';
                    },
                    'data': function (node) {
                        return {'id': node.id};
                    },
                    'dataType': 'json'
                }
            },
            "types": {
                "root": {
                    "icon": "https://www.jstree.com/static/3.3.1/assets/images/tree_icon.png",
                    "valid_children": ["default"]
                },
                "default": {
                    "icon": "fa fa-folder icon-state-warning icon-lg"
                },
                "file": {
                    "icon": "fa fa-file icon-state-warning icon-lg"
                }
            }
        }).bind('select_node.jstree', function (event, data) {
            _sel_node_id = data.node.id;
            _sel_node_name = data.node.text;
            $("#formAdd").hide();
            $("#formUpdate").show();
            getPermissionDetail(_sel_node_id);
        }).on('changed.jstree', function (e, data) {

        }).bind("rename_node.jstree", function (event, data) {

        });

        $(".clearfix .addPermission").on('click', function (e) {

            $("#formAdd").show();
            $("#formUpdate").hide();
            //清空历史输入
            $("#formAdd").find('input').each(function () {
                $(this).val('');
            });
            if (_sel_node_name) {
                $("#newParentId").val(_sel_node_id);
                $("#newParentName").val(_sel_node_name);
            } else {
                $("#newParentName").parent().hide();
            }

        });

        /**
         * 删除
         */
        $(".clearfix .deletePermission").on('click', function (e) {

            if (!_sel_node_id) {
                alert('请选中一个节点');
            }
            window.parent.confirm2('确定删除该节点吗？', function () {
                var ref = $('#jstree_demo').jstree(true),
                    sel = ref.get_selected();
                if (!sel.length) {
                    return false;
                }
                showBlockUI();
                $.post(window.apppath + "/admin/api/permission/delete", {sysPermissionId: sel.toString()}, function (res) {
                    Metronic.unblockUI(Container);
                    if (res.success) {
                        ref.delete_node(sel);
                        $("#formUpdate").find('input').each(function () {
                            $(this).val('');
                        });
                    } else {
                        showMetroMessage(res.message);
                    }
                }, "json");

            })
        });

        /**
         * 更新
         */
        $("#btnSave").on('click', function (e) {
            e.preventDefault();

            var pName = $("input[name=perName]").val();
            var pValue = $("input[name=perValue]").val();
            var pSort = $("input[name=perSort]").val();
            if (pName == '' || pValue == '') {
                return;
            }
            showBlockUI();

            $.post(window.apppath + "/admin/api/permission/update", {
                id: _sel_node_id, name: pName, permission: pValue, sort: pSort
            }, function (res) {
                Metronic.unblockUI(Container);
                if (res.success) {
                    $("#btnSaveMsg").text(res.message);
                    $("#jstree_demo").jstree('refresh');
                } else {
                    alert(res.message);
                }
            }, 'json');
        });

        /**
         * 添加
         */
        $("#btnSaveNew").on('click', function (e) {
            e.preventDefault();

            var nPid = $("#newParentId").val();
            var nPname = $("#newName").val();
            var nPurl = $("#newUrl").val();
            var nValue = $("#newValue").val();

            showBlockUI();

            $.post(window.apppath + "/admin/api/permission/add", {
                name: nPname, permission: nValue, url: nPurl, parentId: nPid
            }, function (res) {
                Metronic.unblockUI(Container);
                if (res.success) {
                    $("#btnSaveNewMsg").text(res.message);
                    $("#jstree_demo").jstree('refresh');
                } else {
                    alert(res.message);
                }
            }, 'json');
        });

        function showBlockUI() {
            Metronic.blockUI({
                message: '处理中...',
                target: Container,
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
                container: Container,
                place: 'prepend'
            });
        }

        function show() {
            $('#myModal').modal('show');
        }

        /**
         * 详情
         * @param perId
         */
        function getPermissionDetail(perId) {
            showBlockUI();
            $.post(window.apppath + "/admin/api/permission/detail", {
                pid: perId
            }, function (res) {
                Metronic.unblockUI(Container);
                if (res.success) {
                    $("input[name=perName]").val(res.data.name);
                    $("input[name=perValue]").val(res.data.permission);
                    $("input[name=perSort]").val(res.data.sort);
                } else {
                    alert(res.message);
                }
            }, 'json');
        }


    }

    return {
        init: function () {
            initTree();
        }
    };
}();