define(["jquery", "easy-admin", "treetable"], function ($, ea) {

    var table = layui.table,
        form = layui.form,
        treetable = layui.treetable;


    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'mall.daily/index',
        add_url: 'mall.daily/add',
        delete_url: 'mall.daily/delete',
        edit_url: 'mall.daily/edit',
        modify_url: 'mall.daily/modify',
    };


    var Controller = {
        index: function () {

            //获取url 参数
            var r = window.location.search;
            if(r != null){
                init.index_url = init.index_url+r;
            }

            var renderTable = function () {
                layer.load(2);
                treetable.render({
                    treeColIndex: 1,
                    treeSpid: 0,
                    homdPid: 99999999,
                    treeIdName: 'id',
                    treePidName: 'pid',
                    url: ea.url(init.index_url),
                    elem: init.table_elem,
                    id: init.table_render_id,
                    toolbar: '#toolbar',
                    page: false,
                    skin: 'line',

                    // @todo 不直接使用ea.table.render(); 进行表格初始化, 需要使用 ea.table.formatCols(); 方法格式化`cols`列数据
                    cols: ea.table.formatCols([[
                        {type: 'checkbox'},
                        {field: 'title', width: 250, title: '名称', align: 'left'},
                        {field: 'member.username', width: 100, title: '会员'},

                        {
                            field: 'is_home',
                            width: 120,
                            title: '类型',
                            templet: function (d) {
                                if (d.pid === 99999999) {
                                    return '<span class="layui-badge layui-bg-blue">日期</span>';
                                }
                                if (d.pid === 0) {
                                    return '<span class="layui-badge layui-bg-gray">项目</span>';
                                } else {
                                    return '<span class="layui-badge-rim">小任务</span>';
                                }
                            }
                        },
                        {
                            field: 'is_cate',
                            width: 80,
                            title: '分类',
                            templet: function (d) {
                                if (d.abc_id > 1) {
                                    return '<span class="layui-badge layui-bg-blue">'+d.abc_title+'</span>';
                                }
                                if (d.cate_id > 1) {
                                    return '<span class="layui-badge layui-bg-gray">'+d.cate_title+'</span>';
                                } else {
                                    return '<span class="layui-badge-rim">自定义</span>';
                                }
                            }
                        },
                        {field: 'score', width: 80, title: '积分'},
                        {field: 'remark', minWidth: 80, title: '总结', edit: 'text'},
                        {field: 'sort', width: 80, title: '排序', edit: 'text'},
                        {field: 'create_time', minWidth: 80, title: '创建时间', search: 'range'},
                        {
                            width: 200,
                            title: '操作',
                            templet: ea.table.tool,
                            operat: [
                                [{
                                    text: '分割项目',
                                    url: init.add_url,
                                    method: 'open',
                                    auth: 'add',
                                    class: 'layui-btn layui-btn-xs layui-btn-normal',
                                    extend: 'data-full="true"',
                                }, {
                                    text: '编辑',
                                    url: init.edit_url,
                                    method: 'open',
                                    auth: 'edit',
                                    class: 'layui-btn layui-btn-xs layui-btn-success',
                                    extend: 'data-full="true"',
                                }],
                                'delete'
                            ]
                        }
                    ]], init),
                    done: function (res,curr,count) {
                        layer.closeAll('loading');

                        //行
                        $('tr').each(function(index, element){
                            if( typeof($(element).attr('data-index')) !== 'undefined'){
                                if(res.data[index-1].status == 1){
                                    $(element).find('td').attr('style','background-color: #009688;');
                                }
                            }
                        });
                    }
                });
            };

            renderTable();

            $('body').on('click', '[data-treetable-refresh]', function () {
                renderTable();
            });

            $('body').on('click', '[data-treetable-delete]', function () {
                var tableId = $(this).attr('data-treetable-delete'),
                    url = $(this).attr('data-url');
                tableId = tableId || init.table_render_id;
                url = url != undefined ? ea.url(url) : window.location.href;
                var checkStatus = table.checkStatus(tableId),
                    data = checkStatus.data;
                if (data.length <= 0) {
                    ea.msg.error('请勾选需要删除的数据');
                    return false;
                }
                var ids = [];
                $.each(data, function (i, v) {
                    ids.push(v.id);
                });
                ea.msg.confirm('确定删除？', function () {
                    ea.request.post({
                        url: url,
                        data: {
                            id: ids
                        },
                    }, function (res) {
                        ea.msg.success(res.msg, function () {
                            renderTable();
                        });
                    });
                });
                return false;
            });

            $('body').on('click', '[data-treetable-done]', function () {
                var tableId = $(this).attr('data-treetable-delete'),
                    url = $(this).attr('data-url');
                tableId = tableId || init.table_render_id;
                url = url != undefined ? ea.url(url) : window.location.href;
                var checkStatus = table.checkStatus(tableId),
                    data = checkStatus.data;
                if (data.length <= 0) {
                    ea.msg.error('请勾选已完成的项目');
                    return false;
                }
                var ids = [];
                $.each(data, function (i, v) {
                    ids.push(v.id);
                });
                ea.msg.confirm('确定？', function () {
                    ea.request.post({
                        url: url,
                        data: {
                            id: ids
                        },
                    }, function (res) {
                        ea.msg.success(res.msg, function () {
                            renderTable();
                        });
                    });
                });
                return false;
            });


            ea.table.listenEdit(init, 'currentTable', init.table_render_id, true);

            ea.listen();
        },
        add: function () {

            ea.listen(function (data) {
                return data;
            }, function (res) {
                ea.msg.success(res.msg, function () {
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                    parent.$('[data-treetable-refresh]').trigger("click");
                });
            });
        },
        edit: function () {



            ea.listen(function (data) {
                return data;
            }, function (res) {
                ea.msg.success(res.msg, function () {
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                    parent.$('[data-treetable-refresh]').trigger("click");
                });
            });
        }
    };
    return Controller;
});