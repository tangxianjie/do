define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'mall.log/index',
        add_url: 'mall.log/add',
        edit_url: 'mall.log/edit',
        delete_url: 'mall.log/delete',
        export_url: 'mall.log/export',
        modify_url: 'mall.log/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar: ['refresh'],
                cols: [[
                    {field: 'id', width: 80, title: 'ID', search: false},
                    {field: 'member.username', minWidth: 80, title: '会员'},
                    {field: 'title', minWidth: 120, title: '名称', search: false},


                    {field: 'score', minWidth: 80, title: '积分',  search: false},
                    {field: 'remark', minWidth: 80, title: '备注信息'},
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