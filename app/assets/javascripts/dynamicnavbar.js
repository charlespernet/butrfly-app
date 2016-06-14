$(window).scroll(function() {
    if ($(".navbar-wagon").offset().top > 50) {
        $('.navbar-wagon').addClass('affix');
        $(".navbar-fixed-top").addClass("top-nav-collapse");
        $(".navbar-wagon-item").addClass('affix2');
    } else {
        $('.navbar-wagon').removeClass('affix');
        $('.navbar-wagon-item').removeClass('affix2');
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
});
