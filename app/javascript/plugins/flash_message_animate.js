const initFlashMessageAnimate = () => {
  // notice fade
  $(document).ready(function(){
    setTimeout(function(){
      $('#notice-wrapper').fadeOut("slow", function() {
        $(this).remove();
      })
    }, 4500);
  });
}

export { initFlashMessageAnimate }
