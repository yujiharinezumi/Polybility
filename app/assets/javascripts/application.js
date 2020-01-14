// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery/dist/jquery.js
//= require select2
//= require_tree .

$(function() {
   function readURL(input) {
       if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
   $('#img_prev').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
       }
   }
   $("#user_img").change(function(){
       readURL(this);
   });
 });

 // $(function () {
 //         $('.form-control').select2({
 //             width: '200px',
 //             placeholder: 'Please Select',
 //             multiple: true
 //         }).on('select2:opening select2:closing', function () {
 //             // select2関数を開いたり閉じたりするときに検索ボックスを非表示にします。
 //             var $searchfield = $(this).parent().find('.select2-search__field');
 //             $searchfield.prop('disabled', true);
 //         });
 //     });
