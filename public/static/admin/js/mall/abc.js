define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'mall.abc/index',
        add_url: 'mall.abc/add',
        edit_url: 'mall.abc/edit',
        delete_url: 'mall.abc/delete',
        export_url: 'mall.abc/export',
        modify_url: 'mall.abc/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar: ['refresh','add'],
                cols: [[
                    {field: 'id', width: 80, title: 'ID', search: false},
                    {field: 'sort', width: 80, title: '排序', edit: 'text', search: false},
                    {field: 'member.username', minWidth: 80, title: '会员'},
                    {field: 'title', minWidth: 80, title: '原则名称'},

                    {field: 'score', minWidth: 80, title: '每天奖励积分', edit: 'text', search: false},
                    {field: 'dec', minWidth: 80, title: '违背扣除积分', edit: 'text', search: false},
                    {field: 'continuous', minWidth: 80, title: '连续天数', edit: 'text', search: false},

                    {field: 'remark', minWidth: 80, title: '备注信息',edit: 'text'},
                    {field: 'status', title: '状态', width: 85, search: 'select', selectList: {0: '禁用', 1: '启用'}, templet: ea.table.switch},
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