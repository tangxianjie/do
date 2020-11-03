define(["jquery", "easy-admin", "echarts", "echarts-theme", "miniAdmin", "miniTab"], function ($, ea, echarts, undefined, miniAdmin, miniTab) {

    var Controller = {

        index: function () {

            miniTab.listen();

            /**
             * 收入线形图
             */
            var echartsRecords = echarts.init(document.getElementById('echarts-records'), 'walden');
            var colors = ['#5793f3', '#d14a61', '#675bba'];
            var optionRecords = {
                title: {
                    text: '一个月内的统计'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data:['积分','项目']
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                toolbox: {
                    feature: {
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data:  JSON.parse(window.CONFIG.days_sale.date_str),
                },
                yAxis: [
                    {
                        type: 'value',
                        name: '积分',
                        min: 0,
                        max: JSON.parse(window.CONFIG.days_sale.max_price),
                        position: 'left',
                        axisLine: {
                            lineStyle: {
                                color: colors[0]
                            }
                        },
                        axisLabel: {
                            formatter: '￥{value}',
                            fontSize:"12"
                        }
                    },

                    {
                        type: 'value',
                        name: '项目',
                        min: 0,
                        max: JSON.parse(window.CONFIG.days_sale.max_number),
                        position: 'right',
                        axisLine: {
                            lineStyle: {
                                color: colors[1]
                            }
                        },
                        axisLabel: {
                            formatter: '{value}个',
                            fontSize:"12"
                        }
                    }
                ],
                series: [
                    {
                        name:'积分',
                        type:'line',
                        stack: '',
                        data:JSON.parse(window.CONFIG.days_sale.price_str)
                    },
                    {
                        name:'项目',
                        type:'line',
                        stack: '',
                        yAxisIndex: 1,
                        data:JSON.parse(window.CONFIG.days_sale.number_str)
                    }
                ]
            };

            echartsRecords.setOption(optionRecords);
            window.addEventListener("resize", function () {
                echartsRecords.resize();
            });


            var echartsRecords1 = echarts.init(document.getElementById('echarts-records1'), 'walden');
            var colors = ['#5793f3', '#d14a61', '#675bba'];
            var optionRecords1 = {
                title: {
                    text: '一个月内的统计'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data:['体重','次数']
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                toolbox: {
                    feature: {
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data:  JSON.parse(window.CONFIG.days_sale.date_str),
                },
                yAxis: [
                    {
                        type: 'value',
                        name: '体重',
                        min: 0,
                        max: JSON.parse(window.CONFIG.days_sale.max_price),
                        position: 'left',
                        axisLine: {
                            lineStyle: {
                                color: colors[0]
                            }
                        },
                        axisLabel: {
                            formatter: '{value}kg',
                            fontSize:"12"
                        }
                    },

                    {
                        type: 'value',
                        name: '次数',
                        min: 0,
                        max: JSON.parse(window.CONFIG.days_sale.max_number),
                        position: 'right',
                        axisLine: {
                            lineStyle: {
                                color: colors[1]
                            }
                        },
                        axisLabel: {
                            formatter: '{value}次',
                            fontSize:"12"
                        }
                    }
                ],
                series: [
                    {
                        name:'体重',
                        type:'line',
                        stack: '',
                        data:JSON.parse(window.CONFIG.days_sale.price_str)
                    },
                    {
                        name:'次数',
                        type:'line',
                        stack: '',
                        yAxisIndex: 1,
                        data:JSON.parse(window.CONFIG.days_sale.number_str)
                    }
                ]
            };

            echartsRecords1.setOption(optionRecords1);
            window.addEventListener("resize", function () {
                echartsRecords1.resize();
            });
        },

    };
    return Controller;
});
