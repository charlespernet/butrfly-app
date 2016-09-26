jQuery(document).ready(function() {
    jQuery('.benefits-icon-left').addClass("invisible").viewportChecker({
        classToAdd: 'animated slideRight',
        offset: 100
       });
});

jQuery(document).ready(function() {
    jQuery('.benefits-icon-right').addClass("invisible").viewportChecker({
        classToAdd: 'animated slideLeft',
        offset: 100
       });
});



jQuery(document).ready(function() {
    jQuery('.benefits-text-block-left').addClass("invisible").viewportChecker({
        classToAdd: 'animated slideRight',
        offset: 100
       });
});

jQuery(document).ready(function() {
    jQuery('.benefits-text-block-right').addClass("invisible").viewportChecker({
        classToAdd: 'animated slideLeft',
        offset: 100
       });
});
