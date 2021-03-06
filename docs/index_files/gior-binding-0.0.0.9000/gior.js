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
        controller.setInitCountry( x.initCountry );
        controller.configure(x.configs);
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

}
