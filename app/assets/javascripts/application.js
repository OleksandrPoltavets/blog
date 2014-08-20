// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require moment
//= require bootstrap-datetimepicker
//= require moment/ru
//= require_tree .


var ready;
ready = function () {

    $('.datepicker').datetimepicker({
        pickTime: false,
        language: 'ru'
        //daysOfWeekDisabled:[0,6]
    });

    $('.double').click(function () {
        var mileage_field = $('#trip_mileage');
        var mileage = mileage_field.val();
        mileage_field.val(mileage*2).trigger('change');
    });

    calculate_cost = function () {
        var fuel_avg = $('#trip_fuel_avg').val();
        var mileage = $('#trip_mileage').val();
        var fuel_price = $('#trip_fuel_price').val();
        var result = ((fuel_avg/100*mileage)*fuel_price).toFixed(2);
        $('#total_cost').text(result);
    };

    $('.calculable').change(calculate_cost);

};

$(document).ready(ready);
$(document).on('page:load', ready);