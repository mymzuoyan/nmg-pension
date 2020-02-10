/**
 * Created by CoderQiang on 2017/5/18.
 */
var ModuleMesComment = function () {
    var _self = "";
    return {
        mesId: 0,
        uid: 0,
        page: 1,
        isPagination: false,
        isLogin: 'false',
        toId: 0,
        toName: '',
        init: function (mId, login_state, id) {
            _self = this;
            _self.mesId = mId;
            _self.isLogin = login_state;
            _self.uid = id;
            _self.getComments();
            $("#linkSignin").click(function () {
                window.location.href = window.apppath + "/home.html";
            });

            $("#btnAddComment").click(function () {
                if (_self.isLogedIn()) {
                    var resContent = $('.reply textarea').val();
                    _self.addComment(resContent);
                }
            })
        },
        getComments: function () {
            $.post(window.apppath + "/moduleMes/api/comments", {mesId: _self.mesId, page: _self.page},
                function (res) {
                    if (res.totalPage > 0) {
                        $("#comment-list").empty();
                        var appendHtml = '';
                        for (var i = 0; i < res.data.length; i++) {
                            var addHmtl = '';
                            var imgUrl = res.data[i].fromAvatar;
                            if (res.data[i].fromAvatar == null || res.data[i].fromAvatar == "") {
                                imgUrl = window.apppath + "/assets/view/images/user_pho.png";
                            }
                            addHmtl += '<div class="media">';
                            addHmtl += '<div class="media-left">';
                            addHmtl += '<a href="#"><img class="media-object" width="60" height="60" data-original="';
                            addHmtl += imgUrl;
                            addHmtl += '" alt="...">';
                            addHmtl += '</a>';
                            addHmtl += '</div>';
                            addHmtl += '<div class="media-body">';
                            addHmtl += '<div class="media-heading comment-user">';
                            addHmtl += '<span>' + res.data[i].fromName + '</span>&nbsp;&nbsp;&nbsp; <span>';
                            addHmtl += moment(res.data[i].createTime).format('MM-DD HH:mm') + '</span>';
                            addHmtl += '<a style="    margin-left: 10px; color: #0a6aa1" class="pull-right comment-reply" data-uid="' + res.data[i].fromId + '" data-uname="' + res.data[i].fromName + '" href="#commentadd" onclick="ModuleMesComment.reply(this)">回复</a>';
                            console.log(res.data[i].fromId);
                            if (res.data[i].fromId == _self.uid||$("#canDelete").val()=="1") {
                                addHmtl += '<a style="    margin-left: 10px; color: #0a6aa1" class="pull-right comment-reply" data-id="' + res.data[i].id + '"  href="#" onclick="ModuleMesComment.deleteComment(this)">删除</a>';
                            }
                            addHmtl += '</div>';
                            addHmtl += '<P style="text-indent: 0px ;">';
                            if (res.data[i].toId) {
                                addHmtl += '<span>回复&nbsp;' + res.data[i].toName + ':&nbsp;</span>';
                            }
                            addHmtl += res.data[i].content;
                            addHmtl += '</P>';
                            addHmtl += '</div>';
                            addHmtl += '</div>';
                            appendHtml += addHmtl;
                        }
                        if (appendHtml) {
                            $("#comment-list").html(appendHtml);
                        }
                        $("#comment-list img").lazyload({
                            effect: 'fadeIn',
                            threshold: 100,
                            placeholder: window.apppath + '/assets/admin/layout/img/avatar.png'
                        });
                        if (!_self.isPagination && res.totalPage > 1) {
                            $.jqPaginator('#comments-paginator', {
                                totalPages: res.totalPage,
                                visiblePages: 10,
                                currentPage: res.page,
                                prev: '<li class="prev"><a href="javascript:;">上一页</a></li>',
                                next: '<li class="next"><a href="javascript:;">下一页</a></li>',
                                page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
                                onPageChange: function (num, type) {
                                    _self.page = num;
                                    if (type != 'init') {
                                        _self.getComments();
                                    }
                                }
                            });
                            _self.initPagination = true;
                        }

                    }
                    else if (_self.page == 1) {
                        $("#comment-list").html('<span>暂无评论</span>');
                    }
                }, 'json');
        },
        addComment: function (content) {
            var is_to_user = (content.indexOf(_self.toId) == 0);
            if (!is_to_user) { //是否回复别人
                _self.toId = 0;
                _self.toName = '';
            } else {
                content = content.substring(_self.toName.length);
            }
            if (content == '') {
                return;
            }
            $("#btnAddComment").button('loading');
            $.post(window.apppath + "/moduleMes/api/comment/add", {
                    mesId: _self.mesId,
                    content: content, toId: _self.toId, toName: _self.toName
                },
                function (res) {
                    if (res.success) {
                        _self.reset();
                    }
                }, 'json');
        },
        reply: function (org) {
            if (_self.isLogedIn()) {
                var toName = '@' + $(org).data("uname") + ': ';
                _self.toName = toName;
                _self.toId = $(org).data("uid");
                $(".reply textarea").val(toName);
            }
        },
        deleteComment: function (org) {
            var id = $(org).data("id");
            //删除
            $.post(window.apppath + "/moduleMes/api/comment/delete", {
                    id: id
                },
                function (res) {
                    if (res.success) {
                        $(org).parent().parent().parent().remove();
                    }
                }, 'json');
        },
        isLogedIn: function () {
            return 'true' == _self.isLogin;
        },
        reset: function () {
            $('.reply textarea').val('');
            $("#btnAddComment").button('reset');
            _self.toName = '';
            _self.toId = 0;
            _self.page = 1;
            _self.getComments();
        },
        setUId: function (id) {
            _self.uId = id;
        }
    }
}();