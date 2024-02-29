import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.ActivityMonitor;
import Toybox.Application;
using Toybox.SensorHistory as Sensor;
var myBitmap;
var widok;
var bot;
var sec;
var date;
var labelText;
var timeString;
var dc;
var sh_sec;
var clockTime;
class MyfirstpojectView extends WatchUi.WatchFace {
    function initialize() {
        WatchFace.initialize();
                
    }
    // Load your resources here
var hei = System.getDeviceSettings().screenHeight;
var wid = System.getDeviceSettings().screenWidth;
var liczba = 0;
var kolor = Graphics.COLOR_RED;
    function onLayout(dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
        System.println(hei);
        System.println(wid);
        var widok = View.findDrawableById("TimeLabel");
        var bot = View.findDrawableById("bottom");   
        var sec = View.findDrawableById("sec");
        var date = View.findDrawableById("date");
        widok.setLocation(hei/2, wid/2-70);
        bot.setLocation(hei/2, (wid/2)+70);
        sec.setLocation((hei/2)+107, (wid/2)-10);
        date.setLocation((hei/2),(wid/2)-80);
        myBitmap = new WatchUi.Bitmap({
            :rezId=>Rez.Drawables.heart,
            :locX=>hei/2+20,
            :locY=>wid/2+80
        });
        System.println("DZIALA RAZ");
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow(){

    }

    // Update the view
    function onUpdate(dc)as Void{  
        widok = View.findDrawableById("TimeLabel") as Text;
        bot = View.findDrawableById("bottom") as Text;   
        sec = View.findDrawableById("sec") as Text;  
        date = View.findDrawableById("date") as Text;
        var b = liczba + 1;
        liczba = b;
        clockTime = System.getClockTime();
        // Get and show the current time
        if(System.getDeviceSettings().is24Hour){
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        widok.setText(timeString);}
    
        date.setText(data());
        //dc.fillCircle(120, 120, 20);
        // Call the parent
        View.onUpdate(dc);                 
        dc.clear();
        dc.setPenWidth(10);
            dc.setColor(Properties.getValue("XDD"), Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(hei/2,wid/2 , wid/2); 
        ustawiania(sec,bot,dc);
        if(sec.isVisible){
        sec.setText(Lang.format("$1$",[clockTime.sec]));}


        }

    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    System.println("ZMIANA1");
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void { //when device gets low power mode
            System.println("ZMIANA2");
            sec.isVisible = true;
            bot.setColor(Graphics.COLOR_BLUE);
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void { //when device gets low power mode
            System.println("ZMIANA3");
            sec.isVisible = false;
            bot.setColor(8421504);//set gray color when inactive
            }
 function ustawiania(sec,bot,dc){
    if (Properties.getValue("second_show")){
        sec.isVisible = true;
    }else{
        sec.isVisible = false;
    }
    switch (Properties.getValue("data_val")){
        case 0:
            bot.isVisible=false;
            //bot.setText(2137);
            //Toybox.System.println("SLUCHAC");\
            break;
        case 1: //steps
            bot.isVisible=true;
            bot.setText(Lang.format("$1$",[ActivityMonitor.getInfo().steps]));
            //Toybox.System.println("LOL");
           // myBitmap.draw(dc);
            break;
        case 2: //heart rate
            bot.isVisible=true;
                labelText = Sensor.getHeartRateHistory({}).next().data;
                bot.setText(Lang.format("$1$",[labelText]));
		        myBitmap.draw(dc);
            break;
        case 3://battery
            bot.isVisible=true;
            bot.setText(Lang.format("$1$%",[System.getSystemStats().battery.toNumber()]));
            break;
    }
 }
}