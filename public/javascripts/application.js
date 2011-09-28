// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

GratefulDeed = {};

if(!window.console){
  window.console = {
    log: function(){
    }
  };
}

$(function(){
  $("body").addClass($.browser.mozilla? "mozilla" : "webkit");

  $("body").ajaxError(function(e, xhr){
    if(xhr.status=="403"){
      window.location.reload();
    } else if(xhr.status=="404"){
      GratefulDeed.notify("This feature has not been activated.",{"type":"error"});
    }
    GratefulDeed.load("hide");
  });
});


GratefulDeed.load = function(action){
  GratefulDeed.notify("Loading...", {'action': action});
};

GratefulDeed.notify = function(message, options){
  var options = options || {};
  var msg_type = options.type || "info";
  var delay = options.delay || 3000;

  $("#notification").html("<span class='"+msg_type+"'>"+message+"</span>");

  if(options.action == "show"){
    $("#notification").show();
  } else if(options.action == "hide"){
    $("#notification").fadeOut();
  } else {
    $("#notification").show().delay(delay).fadeOut();
  }
};

$(document).ajaxStart(function(){
  GratefulDeed.load('show');
});

$(document).ajaxComplete(function(){
  GratefulDeed.load('hide');
});

function timeDiff(deadline){
	var today = new Date();
	var later_date = new Date(deadline);
	console.log(deadline);
	var totalTimeDiff = (later_date.getTime() - today.getTime());
	
	var oDiff = new Object();
	oDiff.days = Math.floor(totalTimeDiff / 1000 / 60 / 60 / 24);
	totalTimeDiff -= oDiff.days * 1000 * 60 * 60 * 24;
	
	oDiff.hours = Math.floor(totalTimeDiff / 1000 / 60 / 60);
	totalTimeDiff -= oDiff.hours * 1000 * 60 * 60;
	
	oDiff.minutes = Math.floor(totalTimeDiff / 1000 / 60);
	totalTimeDiff -= oDiff.minutes * 1000 * 60;
	oDiff.minutes = oDiff.minutes < 10 ? "0" + oDiff.minutes.toString() : oDiff.minutes;
	
	oDiff.seconds = Math.floor(totalTimeDiff / 1000);
	oDiff.seconds = oDiff.seconds < 10 ? "0" + oDiff.seconds.toString() : oDiff.seconds;
	
	return oDiff;
}

GratefulDeed.countdown = function(deadline){
	var oTime = timeDiff(deadline);
	var str = "";
	str += (oTime.days > 0) ? oTime.days + " day(s) " : "";
	str += (oTime.hours > 0) ? oTime.hours + ":" : "";
	str += (oTime.minutes >= 0) ? oTime.minutes + ":" : "00";
	str += (oTime.seconds >= 0) ? oTime.seconds : "00";
	$("#countdown").html(str);
	window.setTimeout("GratefulDeed.countdown('"+deadline+"')", 1000);
};