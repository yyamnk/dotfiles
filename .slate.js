//---------- .slate.js ----------------
// Last Change: 2015-Feb-04.
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
      width: 'screenSizeX/2',
      height: 'screenSizeY/2'
    });
  })
}));

// 左右
slate.bind(util.key('b'), slate.operation('chain', {
  operations: _.map(['left', 'right'], function(d) {
    return slate.operation('push', {
      direction: d,
      style: 'bar-resize:screenSizeX/2'
    });
  })
}));

// 最大化
slate.bind(util.key('s'), function(win) {
  if (!win) return;
  var bounds = win.screen().visibleRect();
  win.doOperation('move', bounds);
});

// undo
slate.bind(util.key('l'), slate.operation('undo'));

// 幅を1/4, 左へ移動
slate.bind(util.key('g'), function(win) {
  if (!win) return;
  var targetWin = win.rect();              // get win info
  var screen = win.screen().visibleRect(); // get screen info
  // 対象のウインドウ幅, 高さを決定
  targetWin.width = (screen.width / 4);
  targetWin.hight = (screen.hight / 2);
  // xを変更,
  x = ( Math.floor(targetWin.x / (screen.width / 4)) -1 ) * (screen.width / 4);
  // ウインドウが外に出ないように
  targetWin.x = Math.max(x, 0);
  // 適用
  win.doOperation('move', targetWin);
});

// 幅を1/4, 右へ移動
slate.bind(util.key('r'), function(win) {
  if (!win) return;
  var targetWin = win.rect(); // 対象のwin, desktopのscreenを取得
  var screen = win.screen().visibleRect(); // 対象のウインドウ幅, 高さを決定
  targetWin.width = (screen.width / 4);
  targetWin.hight = (screen.hight / 2);
  // targetWin.xによってxを変更
  x = ( Math.ceil(targetWin.x / (screen.width / 4)) + 1) * (screen.width / 4);
  // ウインドウが外に出ないように
  targetWin.x = Math.min(x, 0.75 * screen.width);
  win.doOperation('move', targetWin); // 適用
});
