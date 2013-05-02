var hideFloatDiv = function(){
  $('.float-div').animate({
    "margin-left":0
  },1000);
};

var loadComment = function(){
  window_location = window.location.pathname;
  if (window_location.match(/post/) !== null){
    if(window_location.match(/post/)[0] == "post"){
      comment_id = window_location.match(/\d+/)[0];
      window.location.hash = '#' + comment_id;
    }
  }
};




comment_form = "<form class='comment-form'> <textarea class='comment-body' rows='5' placeholder='Your comment...' name='body'></textarea>"+
 "<input class='comment-submit-button' type='submit' value='Submit' > </form>";




$(document).ready(function() {

  loadComment();

  $(document).on('click','.reply-button',function(e){
    var target;
    target = e.target;
    $(target).hide();
    $(target).after(comment_form);
    $('.comment-form').slideDown(1000,function(){
      var post_id;
      post_id = $(target).prev('#post-id').val();
      $('.comment-form').submit(function(e){
        e.preventDefault();
        data = $(this).serialize()+"&post_id="+post_id;
        $.post('/comment/submit',data).done(function(){
          $('.comment-form').slideUp(1000,function(){
            $('.comment-form').remove();
            $(target).toggle();
          });
        });
      });
    });
  });






  $(document).on('click','.new-post-button',function(){
    var post_body = $('.new-post');
    if(post_body.is(":visible")){
      post_body.slideUp(1000);
    }else{
      post_body.slideDown(1000);
    }
  });

  $('.new-post-form').on('submit',function(e){
    e.preventDefault();
    $.post('/post/submit',
            $(this).serialize()
      ).done(function(data){
        console.log(data);
        result = "<span class='success'>Success</span> View your post <a href='/post/"+ data +"'>here</a>";
        $('.post-result').html(result);
        $('.new-post').slideUp(1000);
        setTimeout(function(){$('.post-result').stop().slideDown(1000);},1000);
    });
  });


  $(document).on('click', '.login-button',function(){
    console.log(';idfgpiudsfgpiudsfgiudsfiuhgsdfg')
    if($('.float-div').css("margin-left") == "0px"){
      $('.login-form').toggle();
      $('.float-div').stop().animate({
        "margin-left":-200
      },1000);
    }else if($('.login-form').is(":visible")){
      $('.float-div').stop().animate({
        "margin-left":0
      },1000,function(){$('.login-form').toggle();});
    }else{
      $('.float-div').stop().animate({
        "margin-left":0
      },1000,function(){
        $('.login-form').toggle();
        $('.register-form').toggle();
        $('.float-div').stop().animate({
          "margin-left":-200
        },1000);
      });
    }
  });



  $(document).on('click','.register-button',function(){
    if($('.float-div').css("margin-left") == "0px"){
      $('.register-form').toggle();
      $('.float-div').stop().animate({
        "margin-left":-200
      },1000);
    }else if($('.register-form').is(":visible")){
      $('.float-div').stop().animate({
        "margin-left":0
      },1000,function(){$('.register-form').toggle();});
    }else{
      $('.float-div').stop().animate({
        "margin-left":0
      },1000,function(){
        $('.login-form').toggle();
        $('.register-form').toggle();
        $('.float-div').stop().animate({
          "margin-left":-200
        },1000);
      });
    }
  });



  $('.login-form').on('submit',function(e){
    e.preventDefault();
    $.post('/login',
            $(this).serialize()
      ).done(function(data){
        $('header').html(data);
        hideFloatDiv();
    });
  });

  $('.register-form').on('submit',function(e){
    e.preventDefault();
    $.post('/register',
            $(this).serialize()
      ).done(function(data){
        $('header').html(data);
        hideFloatDiv();
    });
  });
});


