// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require fancybox
//= require ckeditor/init
//= require_tree .

$(document).on('turbolinks:load', function() {

    /*CKEDITOR */
    if ($('.ckeditor')[0]) {
      CKEDITOR.replace($('.ckeditor').attr('id'));
    }
    /*Tags input*/
    $(".tagsinput").tagsinput();
    /*Autoheight*/
    function h(e) {
        if (e.scrollHeight > 70) {
            $(e).css({'height':'auto','overflow-y':'hidden'}).height(e.scrollHeight);
        }
    }
    $('textarea').each(function () {
      h(this);
    }).on('input', function () {
      h(this);
    });

    $(".fancyb").fancybox({
        parent: 'body'
    });

    $('.book_list').masonry({
      gutter: 10,
      itemSelector: '.book'
    });
	

	//Manejador de combos
    $(".combo_change").change(function(){
        var origen = $(this);
        var destino = $("#"+origen.data("destino")+"");
        var grupo = $("#"+origen.data("grupo")+"");

        if($(this).val() != '')
        {
            $.ajax({
            	data: { id : origen.val() },
                url:   origen.data("fuente"),
                type:  'POST',
                dataType: 'json',
                beforeSend: function () {
                    origen.prop('disabled', true);
                },
                success:  function (r) 
                {
                    origen.prop('disabled', false);
                    destino.find('option').remove();

                    $(r).each(function(i, v){ // indice, valor
                        destino.append('<option value="' + v.id + '">' + v.name + '</option>');
                    })

                    destino.prop('disabled', false);
                    grupo.show();
                },
                error: function()
                {
                    alert('Ocurrio un error en el servidor ..');
                    origen.prop('disabled', false);
                    grupo.hide();
                }
            });
        }
        else
        {
            destino.find('option').remove();
            destino.prop('disabled', true);
            grupo.hide();
        }
    }) // fin Manejador de combos

});