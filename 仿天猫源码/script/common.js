// 主页面切换frame
    var changeFrameInRoot = function(index){
        api.execScript({
            name: 'root',
            scritp: 'changeIndexFrame('+index+')'
        });
    };
// 主页面切换frame end


// 用于链接到淘宝链接
    var toDetail = function(obj){
        var url = $api.attr(obj,'data-url');
        var title = $api.attr(obj,'data-title');

        api.openWin({
            name: 'detailwinweb',
            url: '../detailframes/detailwinweb.html',
            pageParam: {
                title: title,
                url: url
            },
            rect: {
                x: 0,
                y: 0,
                w: 'auto',
                h: 'auto'
            }
        });
    };
// 
// 打开分类列表
    var openClassify = function(){
        api.openWin({
            name: 'detailclassify',
            url: './html/detailframes/detailclassify.html',
            bounces: false,
            rect: {
                x: 0,
                y: 0,
                w: 'auto',
                h: 'auto'
            }
        });
    };
// 
// 语音识别
    var openSpeechRec = function(){
        api.openWin({
            name: 'record',
            url: './html/detailframes/record.html',
            pageParam: {
                name: '语音搜索',
                title: '语音搜索'
            },
            rect: {
                x: 0,
                y: 0,
                w: 'auto',
                h: 'auto'
            }
        });
    };
// 
// 二维码
    var openScanner = function(){
        var scanner = api.require('scanner');
        scanner.open(function(ret,err) {
            api.alert({
                title: '扫描结果', 
                msg: ret.msg
            });
        });
        // scanner.openView({
        //     x: 0,
        //     y: 0,
        //     w: api.winWidth,
        //     h: api.winHeight
        // },function(ret,err){
        //     api.alert({
        //         title: '扫描结果', 
        //         msg: ret.msg
        //     });
        // });

    };
// 
// 通用header的window
    var openCommon = function(name,title){

        api.openWin({
            name: name,
            url: '../detailframes/'+name+'.html',
            pageParam: {
                name: name,
                title: title
            },
            rect: {
                x: 0,
                y: 0,
                w: 'auto',
                h: 'auto'
            }
        });
    }
    var openCommon2 = function(name,title){
        api.openWin({
            name: name,
            url: './'+name+'.html',
            pageParam: {
                name: name,
                title: title
            },
            rect: {
                x: 0,
                y: 0,
                w: 'auto',
                h: 'auto'
            }
        });
    }
    var openCommon3 = function(name,title){
        api.openWin({
            name: name,
            url: './html/detailframes/'+name+'.html',
            pageParam: {
                name: name,
                title: title
            },
            rect: {
                x: 0,
                y: 0,
                w: 'auto',
                h: 'auto'
            }
        });
    }
// 
// // fun进入topic详细页
//     var funToTopic = function(){
//         // arguments
//         api.openFrame({
//             name: 'shareframe',
//             url: '../detailframes/shareframe.html',
//             bounces: false,
//             rect: {
//                 x: 0,
//                 y: 0,
//                 w: 'auto',
//                 h: 'auto'
//             }
//         });
//     };
// // 