using Toybox.Time.Gregorian as Calendar;
using Toybox.Time;
import Toybox.System;
using Toybox.WatchUi;
import Toybox.Graphics;
using Toybox.Lang;
function data(){
    var info = Calendar.info(Toybox.Time.now(), Toybox.Time.FORMAT_MEDIUM);
    var date_finish = Lang.format("$1$ $2$", [info.day, info.month]);
    return date_finish;
}