$(function(){
  if ($(".mypage").length) {
    const path = location.pathname;
    
    switch(path) {

      case "/users/sell_items":
        $("#mypage").removeClass("selected");
        $("#sold_items").addClass("selected");
        break;

      case "/users/bought_items":
        $("#mypage").removeClass("selected");
        $("#bought_items").addClass("selected");
        break;

      case "/users/favorite_items":
        $("#mypage").removeClass("selected");
        $("#favorite_items").addClass("selected");
        break;

      case "/users/edit_address":
        $("#mypage").removeClass("selected");
        $("#edit_address").addClass("selected");
        break;

      case "/payment_cards":
        $("#mypage").removeClass("selected");
        $("#payment_method").addClass("selected");
        break;

      case "/payment_cards/new":
        $("#mypage").removeClass("selected");
        $("#payment_method").addClass("selected");
        break;

      case "/users/edit":
        $("#mypage").removeClass("selected");
        $("#edit_user").addClass("selected");
        break;

      case "/users/edit_profile":
        $("#mypage").removeClass("selected");
        $("#edit_profile").addClass("selected");
        break;
    }

  }
});
