$(function() {

      // 途中から固定したいボックスの情報を得る
      var navBox = $("#fixedNavi");
      var navOst = navBox.offset().top;

      // スクロールされた際に実行
      $(window).scroll( function() {
         // 現在のスクロール位置と、固定したいボックスの位置を比較
         if( $(window).scrollTop() > navOst ) {
            // 固定用のclassを付加
            navBox.addClass("fixBox");
        }
        else {
            // 固定用のclassを削除
            navBox.removeClass("fixBox");
        }
    });

  });