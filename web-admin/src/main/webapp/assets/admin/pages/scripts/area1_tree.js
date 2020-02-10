/**
 * Created by Administrator on 2016/9/9.
 */
var AreaTree1 = function () {

    var _self = "";
    return {
        areaId: '',//区域id
        sysRole: "",
        hasInit: false,
        isCheckBox: false,
        plugins: "",
        selectServiceOrg: false,
        init: function (sysRole) {
            _self = this;
            _self.sysRole = sysRole;
            _self.plugins = ["types", "wholerow"];
            if (_self.isCheckBox) {
                _self.plugins.push("checkbox");
            }
            $("#areaTree1").jstree({
                "core": {
                    "themes": {
                        "responsive": false
                    },
                    // so that create works
                    "check_callback": true,
                    'data': function (obj, cb) {
                        $.post(window.apppath + "/admin/api/area/getTree", {
                                sysRole: _self.sysRole
                            },
                            function (res) {
                                if (res) {
                                    cb.call(this, res);
                                }
                            }, 'json');
                    }
                },
                "types": {
                    "default": {
                        "icon": "fa fa-folder icon-state-warning icon-lg",
                        draggable: false
                    },
                    "file": {
                        "icon": "fa fa-file icon-state-warning icon-lg"
                    },
                    "serviceOrg": {
                        "icon": "fa   fa-group icon-state-warning icon-lg"
                    }
                },
                "plugins": _self.plugins
            });

            // $(".col-md-12 .select").on('click', function (e) {
            //     _self.getSelectArea();
            // });
            _self.hasInit = true;
        },
        init2: function () { //纯区域jstree，根据用户所在区域
            _self = this;
            _self.plugins = ["types", "wholerow"];
            $("#areaTree1").jstree({
                "core": {
                    "themes": {
                        "responsive": false
                    },
                    // so that create works
                    "check_callback": true,
                    'data': function (obj, cb) {
                        $.post(window.apppath + "/admin/api/area/getAreaTree", {},
                            function (res) {
                                if (res) {
                                    cb.call(this, res);
                                }
                            }, 'json');
                    }
                },
                "types": {
                    "default": {
                        "icon": "fa fa-folder icon-state-warning icon-lg",
                        draggable: false
                    },
                    "file": {
                        "icon": "fa fa-file icon-state-warning icon-lg"
                    }
                },
                "plugins": _self.plugins
            });
        },
        getSelectArea: function () { //获取选择节点的id
            var ref = $('#areaTree1').jstree(true);
            _self.areaId = ref.get_selected().toString();
            if (_self.isCheckBox) {
                var result = "";
                var strs = _self.areaId.split(",");
                for (var i in strs) {
                    if (strs[i].indexOf("serviceOrg") >= 0) {
                        result += strs[i] + ",";
                    }
                }
                if (result == "") {
                    alert("请选择组织");
                    return -1;
                }
                else {
                    result = result.substr(0, result.lastIndexOf(","));
                }
                return result;
            }
            else {
                //组织管理员
                if (_self.sysRole == "6") {
                    if (_self.areaId.indexOf("serviceOrg") < 0) {
                        alert("请选择组织");
                        return -1;
                    }
                }
            }
            //区域管理员
            if (_self.sysRole == "3") {
                //区
                var areaName = _self.getSelectAreaName(_self.areaId);
                if (areaName.indexOf("内蒙古市") < 0 ) {
                    if (areaName.indexOf("区") < 0 && areaName.indexOf("县") < 0) {
                        alert("请选择区域");
                        return -1;
                    }
                }
            }
            // else if (_self.sysRole == "13") {
            //     //街道
            //     var areaName = _self.getSelectAreaName(_self.areaId);
            //     if (areaName.indexOf("街道") < 0 && areaName.indexOf("徐庄软件园管委会") < 0) {
            //         alert("请选择街道");
            //         return -1;
            //     }
            // }
            // else if (_self.sysRole == "14") {
            //     //社区
            //     var areaName = _self.getSelectAreaName(_self.areaId);
            //     if (areaName.indexOf("居委会") < 0) {
            //         alert("请选择居委会");
            //         return -1;
            //     }
            // }
            return _self.areaId;
        },
        getSelectRange: function () { //获取选择节点的id
            var ref = $('#rangeTree').jstree(true);
            _self.areaId = ref.get_selected().toString();
            return _self.areaId;
        },
        getSelectAreaName: function (selectId) { //获取选择节点的id
            var node = $('#areaTree1').jstree(true).get_node(selectId);
            return node.text;
        },
        getSelectRangeName: function (selectId) { //获取选择节点的id
            var node = $('#rangeTree').jstree(true).get_node(selectId);
            return node.text;
        },
        getAllAreaName: function (selectId) { //获取选择区域的全程，（加上父节点）
            var allAreaName = "";
            var node = $('#areaTree1').jstree(true).get_node(selectId);
            while (node) {
                if (node.text != null && node.text != "")
                    allAreaName = node.text + "," + allAreaName;
                node = $('#areaTree1').jstree(true).get_node(node.parent);
            }
            return allAreaName.substr(0, allAreaName.length - 1);
        },
        getAllRangeName: function (selectId) { //获取选择区域的全程，（加上父节点）
            var allAreaName = "";
            var node = $('#rangeTree').jstree(true).get_node(selectId);
            while (node) {
                if (node.text != null && node.text != "")
                    allAreaName = node.text + "," + allAreaName;
                node = $('#rangeTree').jstree(true).get_node(node.parent);
            }
            return allAreaName.substr(0, allAreaName.length - 1);
        },
        getAllAreaCode: function (selectId) {
            var allAreaName = "";
            var node = $('#areaTree1').jstree(true).get_node(selectId);
            while (node) {
                if (node.text != null && node.text != "") {
                    var districtId = '';
                    districtId = new this.MyJqueryAjax(window.apppath + "/admin/api/area/getDistrictId", {id: node.id}).request().trim();
                    allAreaName = districtId + allAreaName;
                }
                node = null;
            }
            return allAreaName.replace(/"/g, "");
        },
        getCheckBoxSelect: function () {
            var node_checked = $('#rangeTree').jstree('get_checked');//默认返回节点id,传full返回节点对象

            var allNodes = [];
            for (var i = 0; i < node_checked.length; i++) {

                var sel_node = $('#rangeTree').jstree('get_node', node_checked[i]);
                //添加选中节点
                allNodes.push(sel_node.id);
                var is_leaf = $('#rangeTree').jstree('is_leaf', sel_node);
                if (is_leaf) {
                    //添加选中节点的所有父节点
                    var sel_node_parents = sel_node.parents;
                    allNodes = allNodes.concat(sel_node_parents);
                }

            }
            if (allNodes.length == 0) {
                return;
            }
            console.log(allNodes);
            // 节点去重
            var uniqueNodes = _self.uniqueNodeIds(allNodes);
            return uniqueNodes;
        },
        /**
         * 节点去重
         * @param arr
         * @returns {Array}
         */
        uniqueNodeIds: function (arr) {
            var result = [], hash = {};
            for (var i = 0, elem; (elem = arr[i]) != null; i++) {
                if (!hash[elem]) {
                    result.push(elem);
                    hash[elem] = true;
                }
            }
            return result;
        },
        serviceRangeInit: function (serviceRange) {
            //只展示叶节点,父节点自动半选或全选
            var node_leafs = new Array();
            for (var k = 0; k < serviceRange.split(",").length; k++) {
                console.log(parseInt(serviceRange.split(",")[k]));
                if (serviceRange.split(",")[k] != "#") {
                    var n = $('#rangeTree').jstree('get_node', parseInt(serviceRange.split(",")[k]));
                    var is_leaf = $('#rangeTree').jstree('is_leaf', n);
                    if (is_leaf) {
                        node_leafs.push(n);
                    }
                }
            }
            $('#rangeTree').jstree('uncheck_all');
            $('#rangeTree').jstree('check_node', node_leafs);
        },
        isInit: function () {
            return _self.hasInit;
        },
        refresh: function (sysRole) {
            _self.sysRole = sysRole;
            $("#areaTree1").jstree("destroy");
            _self.init(sysRole);
        },
        setCheckBox: function (b) {
            this.isCheckBox = b;
        },
        setSelectServiceOrg: function (b) {
            this.selectServiceOrg = b;
        },
        MyJqueryAjax: function (v_url, data, func, dataType) {
            this.url = v_url;
            this.data = data;
            this.func = func;
            this.request = function () {
                var v_response;
                $.ajax({
                    async: false, //同步请求
                    url: v_url, //请求地址
                    //contentType:"application/x-www-form-urlencoded;charset=UTF-8",
                    data: data, //参数
                    cache: false, //设置为 false 将不会从浏览器缓存中加载请求信息
                    type: "POST",
                    dataType: dataType == null ? "text" : dataType,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("MyJqueryAjax Request Error!");
                    },
                    success: (func !== null && func != undefined) ? func : function (req) {
                        v_response = req;
                    }
                });
                return v_response;
            };
        }
    }

}();
