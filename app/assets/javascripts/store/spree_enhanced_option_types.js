//= require store/spree_core
var add_image_handlers = function() {
  $("#main-image").data('selectedThumb', $('#main-image img').attr('src'));
  $('ul.thumbnails li').eq(0).addClass('selected');
  $('ul.thumbnails li a').click(function() {
    $("#main-image").data('selectedThumb', $(this).attr('href'));
    $('ul.thumbnails li').removeClass('selected');
    $(this).parent('li').addClass('selected');
    return false;
  }).hover(
    function() {
      $('#main-image img').attr('src', $(this).attr('href').replace('mini', 'product'));
    },
    function() {
      $('#main-image img').attr('src', $("#main-image").data('selectedThumb'));
    }
    );
};

jQuery(document).ready(function() {
  add_image_handlers();
});

function update_variant_images(vid, text) {
  jQuery("#variant-thumbnails").empty();
  if (text) jQuery("#variant-images span").html(text);

  if (images && images[vid] && images[vid].length > 0) {
    $.each(images[vid], function(i, link) {
      jQuery("#variant-thumbnails").append('<li>' + link + '</li>');
    });

    jQuery("#variant-images").show();
  } else {
    jQuery("#variant-images").hide();
  }

  add_image_handlers();

  var link = jQuery("#variant-thumbnails a")[0];

  jQuery("#main-image img").attr({
    src: jQuery(link).attr('href')
    });
  jQuery('ul.thumbnails li').removeClass('selected');
  jQuery(link).parent('li').addClass('selected');
}

function possible_combination(values){
  var any_match = false;
  jQuery.each(ov_combinations, function(i, combination){
    var result = true
    jQuery.each(values, function(i, v){
      result = result && (combination[i] == v)
    })
    any_match = any_match || result;
  })
  return(any_match);
}

// Callback called each time variant is changed.
function variant_changed(variant_id) {
  var va = variant_attributes[variant_id];
  var new_price = Number(va.price);
  if($('.price')[0]) {
    //new_price = $('.price').text().replace(/[\d,.-]+/, new_price.toFixed(2));
    //$('.price').text(new_price);
    $('.price').text('£' + String(new_price.toFixed(2)));

  }
  if($('span.on-hand')[0]) {
    $('span.on-hand').text(va.on_hand);
  }
  //update_variant_images(variant_id, va.description);
}

$('select.option-type').bind("change", function(){
  var selected_values = [];
  // for each option group (represented by select)
  $("select.option-type").map(function(i, select){
    // for each option value
    $(select).find("option").each(function(i, option){
      var ov_value = option.value.replace(/\D+/, '');
      // check if there's at least one possible combination for this setting
      var can_be_set = possible_combination(selected_values.concat([ov_value]));
      $(option).attr('disabled', !can_be_set)
      if (!can_be_set) // uncheck if it can't be used'
        $(option).attr('selected', false);
    })

    // find radio that is checked, or can be checked
    var selected_option = $(select).find("option:selected");
    if (!selected_option[0])
      selected_option = $(select).find("option:selected").attr('selected', true)
    // this should be absolutelly always possible, but just to be sure
    if (selected_option[0])
      selected_values.push(selected_option.attr('value').replace(/\D+/, ''))
  })

  variant_changed(ov_to_variant[selected_values]);
})