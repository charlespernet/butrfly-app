$(window).scroll(function() {
    if ($(".navbar-wagon").offset().top > 50) {
        $('.navbar-wagon').addClass('affix');
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
        $('.navbar-wagon').removeClass('affix');
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
});
