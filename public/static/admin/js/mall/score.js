define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'mall.score/index',
        delete_url: 'mall.score/delete',
        export_url: 'mall.score/export',
        modify_url: 'mall.score/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar: ['refresh'],
                cols: [[
                    {field: 'username', minWidth: 80, title: '会员', search: false},
                    {field: 'title', minWidth: 80, title: '等级名称', search: false},
                    {field: 'score', minWidth: 80, title: '升级积分', edit: 'text', search: false},
                    {field: 'consume', minWidth: 80, title: '每日消耗', edit: 'text', search: false},
                    {field: 'remark', minWidth: 80, title: '备注信息', edit: 'text', search: false},
                    {
                        width: 80,
                        title: '操作',
                        templet: ea.table.tool,
                        operat: ['delete']
                    }
                ]],
            });

            ea.listen();
        },

    };
    return Controller;
});