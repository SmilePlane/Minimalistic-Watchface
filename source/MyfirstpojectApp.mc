import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.System;

class MyfirstpojectApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView(){
        return [ new MyfirstpojectView() ];
    }
    function onSettingsChanged() { // triggered by settings change in GCM
    System.println("DZIALA");
    sec.setColor(Properties.getValue("seconds_color"));
    widok.setColor(Properties.getValue("num_col"));
    date.setColor(Properties.getValue("date_color"));
    WatchUi.requestUpdate(); // update the view to reflect changes
}
}

//function getApp() as MyfirstpojectApp {
//    return Application.getApp() as MyfirstpPojectApp;
//}//TEste