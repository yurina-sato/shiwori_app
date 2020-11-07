$(function(){
  $('#event-image').change(function(){
    if ( !this.files.length ) {
      return;
    }
    $('#image-preview').text('');
 
    // 格納ファイルを取得し、ファイル数を数える
    var $files = $(this).prop('files'); 
    var len = $files.length;

    
    for ( var i = 0; i < len; i++ ) {
      var file = $files[i];
      var fr = new FileReader();
 
      fr.onload = function(e) {
        // ファイル毎にimgタグとsrcを生成
        var src = e.target.result;
        var img = $('<div><img src="'+ src +'"></div>');
        
        $('#image-preview').append(img);
      }
      fr.readAsDataURL(file);
    }
 
    $('#image-preview').css('display','block');
  });

});
