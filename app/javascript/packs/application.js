require('jquery');
require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

import 'jquery';
import $ from 'jquery';

// import '../posts/modal';

import { randomColor } from '../posts/style';
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
randomColor();
$(document).on('turbolinks:load', function() {
  // when a post is clicked, show its full content in a modal window
  $("body").on( "click", ".single-post-card, .single-post-list", function() {
    var posted_by = $(this).find('.post-content .posted-by').html();
    var post_heading = $(this).find('.post-content h3').html();
    var post_content = $(this).find('.post-content p').html();
    var interested = $(this).find('.post-content .interested').attr('href');
    $('.modal-header .posted-by').text(posted_by);
    $('.loaded-data h3').text(post_heading);
    $('.loaded-data p').text(post_content);
    $('.loaded-data .interested a').attr('href', interested);
    $('.myModal').css("display", "block");
    // $('.myModal').modal('show');
  });
});
$('#myModal').on('shown.bs.modal', function () {
  var posted_by = $(this).find('.post-content .posted-by').html();
  var post_heading = $(this).find('.post-content h3').html();
  var post_content = $(this).find('.post-content p').html();
  var interested = $(this).find('.post-content .interested').attr('href');
  $('body').trigger('focus')
});