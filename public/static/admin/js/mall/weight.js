define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'mall.weight/index',
        add_url: 'mall.weight/add',
        delete_url: 'mall.weight/delete',
        export_url: 'mall.weight/export',
        modify_url: 'mall.weight/modify',
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
                    {field: 'score', minWidth: 80, title: '体重', edit: 'text', search: false},
                    {field: 'remark', minWidth: 80, title: '备注信息',edit: 'text'},

                    {field: 'create_time', minWidth: 80, title: '创建时间', search: 'range'},
                    {
                        width: 250,
                        title: '操作',
                        templet: ea.table.tool,
                        operat: ['delete']
                    }
                ]],
            });

            ea.listen();
        },
        add: function () {
            ea.listen();
        },

    };
    return Controller;
});