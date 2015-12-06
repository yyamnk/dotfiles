//---------- .slate.js ----------------
// Last Change: 2015-Nov-23.
// for dvorak user
//-------------------------------------
// http://www.infiniteloop.co.jp/blog/2013/08/osx_slate/
var util = {
  // alt + cmd ..
  key: function(key, mod) {
    return key + ':alt;cmd' + (mod ? ',' + mod : '');
  },
  focusWindow: function(f) {
    var hit = false;
    slate.eachApp(function(app) {
      if (hit) return;
      app.eachWindow(function(win) {
        if (hit) return;
        if (f(win)) {
          win.focus();
          hit = true;
        }
      });
    });
  },
  nextScreen: function(screen) {
    return slate.screenForRef(String( (screen.id()+1)%slate.screenCount() ));
  }
};

// Slateの再起動
// slate.bind(util.key('r', 'cmd'), function(win) {
//   slate.operation('relaunch').run();
// });

// 中央に配置する
var put_center = slate.operation('move', {
  'x' : 'screenOriginX+(screenSizeX)/4',
  'y' : 'screenOriginY',
  'width' : '(screenSizeX)/2',
  'height' : 'screenSizeY'
});
slate.bind(util.key('m'), put_center);

// 4隅
var corners = slate.bind(util.key('c'), slate.operation('chain', {
  operations: _.map(['top-right', 'top-left', 'bottom-left', 'bottom-right'], function(d) {
    return slate.operation('corner', {
      direction: d,
      width: 'screenSizeX/3',
      height: 'screenSizeY/2'
    });
  })
}));

//左右
slate.bind(util.key('b'), slate.operation('chain', {
  operations: _.map(['left', 'right'], function(d) {
    return slate.operation('push', {
      direction: d,
      style: 'bar-resize:screenSizeX/2'
    });
  })
}));

//幅3/8で左, 5/8で右
var left_third_eight = slate.operation('push', {
  direction : 'left',
  style: 'bar-resize:screenSizeX*3/8'
});
var right_five_eight = slate.operation('push', {
  direction : 'right',
  style: 'bar-resize:screenSizeX*5/8'
});
// slate.bind(util.key('v'), slate.operation('chain', {
//   'operations' : [ left_third_eight, right_five_eight ]
// }));

//幅1/3で左, 2/3で右
var left_one_third = slate.operation('push', {
  direction : 'left',
  style: 'bar-resize:screenSizeX/3'
});
var right_two_third = slate.operation('push', {
  direction : 'right',
  style: 'bar-resize:screenSizeX*2/3'
});
// slate.bind(util.key('v'), slate.operation('chain', {
//   'operations' : [ left_one_third, right_two_third ]
// }));

//幅28%で左, 72%で右
var left_28p = slate.operation('push', {
  direction : 'left',
  style: 'bar-resize:screenSizeX/10*2.8'
});
var right_72p = slate.operation('push', {
  direction : 'right',
  style: 'bar-resize:screenSizeX/10*7.2'
});
slate.bind(util.key('v'), slate.operation('chain', {
  'operations' : [ left_28p, right_72p ]
}));

// 最大化
slate.bind(util.key('s'), function(win) {
  if (!win) return;
  var bounds = win.screen().visibleRect();
  win.doOperation('move', bounds);
});

// undo
slate.bind(util.key('-'), slate.operation('undo'));

// 幅を1/6, 左へ移動
slate.bind(util.key('g'), function(win) {
  if (!win) return;
  var targetWin = win.rect();              // get win info
  var screen = win.screen().visibleRect(); // get screen info
  // 対象のウインドウ幅, 高さを決定
  targetWin.width = (screen.width / 6);
  targetWin.hight = (screen.hight / 2);
  // xを変更,
  x = ( Math.floor(targetWin.x / (screen.width / 6)) -1 ) * (screen.width / 6);
  // ウインドウが外に出ないように
  targetWin.x = Math.max(x, 0);
  // 適用
  win.doOperation('move', targetWin);
});

// 幅を1/6, 右へ移動
slate.bind(util.key('r'), function(win) {
  if (!win) return;
  var targetWin = win.rect(); // 対象のwin, desktopのscreenを取得
  var screen = win.screen().visibleRect(); // 対象のウインドウ幅, 高さを決定
  targetWin.width = (screen.width / 6);
  targetWin.hight = (screen.hight / 2);
  // targetWin.xによってxを変更
  x = ( Math.ceil(targetWin.x / (screen.width / 6)) ) * (screen.width / 6);
  // ウインドウが外に出ないように
  targetWin.x = Math.min(x, screen.width/6);
  win.doOperation('move', targetWin); // 適用
});
