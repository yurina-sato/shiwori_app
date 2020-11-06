$(function(){
  fileField = $('#event-image')
  // 選択された画像を取得し表示
  fileField.on('change', fileField, function(e) {
    var file = e.target.files[0]
    var reader = new FileReader(),
    $preview = $("#image-preview");
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "30%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});
