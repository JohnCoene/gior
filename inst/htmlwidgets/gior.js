HTMLWidgets.widget({

  name: 'gior',

  type: 'output',

  factory: function(el, width, height) {

    var container,
        controller;

    return {

      renderValue: function(x) {

        container = document.getElementById( el.id );
        controller = new GIO.Controller( container );

        controller.addData( x.data );

        if(x.hasOwnProperty('initCountry')){
          controller.setInitCountry( x.initCountry );
        }
        controller.configure(x.configs);

        function share ( selectedCountry, relatedCountries ) {
          Shiny.setInputValue(el.id + '_selected' + ":giorParseJS", selectedCountry);
          Shiny.setInputValue(el.id + '_related' + ":giorParseJS", relatedCountries);
        }

        if (HTMLWidgets.shinyMode) {
          controller.onCountryPicked( share );
        }

        if(x.hasOwnProperty('style')){
          controller.setStyle( x.style );
        }

        controller.init();

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      },

      getMap: function(){
        return( controller );
      }

    };
  }
});

function get_gior(id){

  var htmlWidgetsObj = HTMLWidgets.find("#" + id);

  var gior;

  if (typeof htmlWidgetsObj != 'undefined') {
    gior = htmlWidgetsObj.getMap();
  }

  return(gior);
}

if (HTMLWidgets.shinyMode) {

  Shiny.addCustomMessageHandler('g_clear_p',
    function(data) {
      var globe = get_gior(data.id);
      if (typeof globe != 'undefined') {
        globe.clearData();
      }
  });

  Shiny.addCustomMessageHandler('g_data_p',
    function(data) {
      var globe = get_gior(data.id);
      if (typeof globe != 'undefined') {
        globe.addData(data.json);
      }
  });

  Shiny.addCustomMessageHandler('g_init_p',
    function(data) {
      var globe = get_gior(data.id);
      if (typeof globe != 'undefined') {
        globe.init();
      }
  });

  Shiny.addCustomMessageHandler('g_switch_p',
    function(data) {
      var globe = get_gior(data.id);
      if (typeof globe != 'undefined') {
        globe.switchCountry(data.country);
      }
  });

}
