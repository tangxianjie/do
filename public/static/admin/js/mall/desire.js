define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'mall.desire/index',
        add_url: 'mall.desire/add',
        edit_url: 'mall.desire/edit',
        delete_url: 'mall.desire/delete',
        export_url: 'mall.desire/export',
        modify_url: 'mall.desire/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar: ['refresh','add'],
                cols: [[
                    {type: 'checkbox'},
                    {field: 'id', width: 80, title: 'ID', search: false},
                    {field: 'sort', width: 80, title: '排序', edit: 'text', search: false},
                    {field: 'member.username', minWidth: 80, title: '会员'},
                    {field: 'title', minWidth: 80, title: '愿望名称'},
                    {field: 'score', minWidth: 80, title: '消耗积分', edit: 'text', search: false,sort:true },
                    {field: 'remark', minWidth: 80, title: '备注信息',edit: 'text'},
                    {field: 'status', title: '状态', width: 100, search: 'select', selectList: {0: '完成', 1: '启用'},tips:'启用|完成', templet: ea.table.switch},
                    {field: 'end_time', minWidth: 80, title: '过期时间', search: 'range'},
                    {field: 'create_time', minWidth: 80, title: '创建时间', search: 'range'},
                    {
                        width: 250,
                        title: '操作',
                        templet: ea.table.tool,
                        operat: ['edit','delete']
                    }
                ]],
            });

            ea.listen();
        },
        add: function () {
            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
    };
    return Controller;
});