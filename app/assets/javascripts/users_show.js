$(function(){
    let path = location.pathname;
    
    if (path == "/users/edit_address") {
      $("#mypage").removeClass("selected");
      $("#edit_address").addClass("selected");
    }

    if (path == "/users/edit") {
      $("#mypage").removeClass("selected");
      $("#edit_user").addClass("selected");
    }

    if (path == "/users/edit_profile") {
      $("#mypage").removeClass("selected");
      $("#edit_profile").addClass("selected");
    }
    
});
