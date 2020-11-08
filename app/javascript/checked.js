function check() {
  const items = document.querySelectorAll(".item-checked");
  items.forEach(function (item) { 

    // setIntervalの重複を回避
    if (item.getAttribute("data-load") != null) {
      return null;
    }
    item.setAttribute("data-load", "true");

    // クリックされた時の処理
    item.addEventListener("click", () => { 
      // URLに必要なidを各種取得
      const tripId = item.getAttribute("data-id-1");
      const listId = item.getAttribute("data-id-2");
      const itemId = item.getAttribute("data-id-3");

      //送信するリクエスト内容
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/trips/${tripId}/lists/${listId}/items/${itemId}`, true);
      XHR.responseType = "json";
      XHR.send();

      //レスポンスの処理内容
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        }

        // checkedカラムへの処理
        const checkedItem = XHR.response.item;
        if (checkedItem.checked === true) {
          item.setAttribute("data-check", "true");
        } else if (checkedItem.checked === false) {
          item.removeAttribute("data-check");
        }
      };
    });
  });
}
setInterval(check, 1000);