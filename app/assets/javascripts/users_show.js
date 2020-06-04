$(function(){
  if ($(".mypage").length) {
    const path = location.pathname;
    
    switch(path) {

      case "/users/edit_address":
        $("#mypage").removeClass("selected");
        $("#edit_address").addClass("selected");
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
