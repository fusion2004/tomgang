// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(document).ready(function() {
  var $user_progress = $('#user_level_progress'),
      $user_progress_text = $user_progress.find('.progress-data'),
      $user_progress_meter = $user_progress.find('.meter'),
      $secs_remaining = $('#level_progress_secs_remaining');
  var last_level_up = $user_progress.data('last-level-up') * 1000,
      next_level_up = $user_progress.data('next-level-up') * 1000,
      last_date = new Date(last_level_up),
      next_date = new Date(next_level_up),
      total_secs = (next_date - last_date)/1000;

  window.time_to_reload = false;
  window.initial_progress = false;

  var update_progress = function() {
    var d = new Date(),
        current_secs = (d - last_date)/1000,
        remaining_secs = total_secs - current_secs,
        progress = (current_secs / total_secs) * 100;

    if(remaining_secs < 0) {
      remaining_secs = 0;
      progress = 100;
      if(!window.time_to_reload) {
        setTimeout("document.location.reload()", 1000);
        window.time_to_reload = true;
      }
    }

    $user_progress_meter.width(progress+'%');
    //$user_progress_text.text((Math.round(progress*10)/10).toFixed(1)+'%');
    //$user_progress_text.text(Math.round(progress)+'%');
    $user_progress_text.text(progress.toFixed(0)+'%');
    $secs_remaining.text(Math.ceil(remaining_secs));

    if(!window.initial_progress) {
      $user_progress_meter.addClass('progress-animate');
      window.initial_progress = true;
    }
  };
  if(window.user_signed_in) {
    var progress_timer = setInterval(update_progress, 300);
  }

  $('.field_with_errors').find('label, input').addClass('error');
});