
dollar = {}; 

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESC
        $(".Container").fadeOut(500);
        setTimeout(() => {  dollar.CloseAyarMenu(); }, 500);

            break;
    }
});

dollar.CloseAyarMenu = function() {
    $(".Container").css({"display":"none"});






    $.post('https://src-company/CloseMenu:NuiCallback',JSON.stringify({data: true}));
};




var fee = 0;
var money = 0;
var totalcashout = 0;
var jobstatus = false
var jobname = 'nil'
var feemoney = 0
window.addEventListener('message', function(event) {
    eFunc = event.data
    if (eFunc.action == "showui") {
        $(".Container").fadeIn(500);

        fee  = eFunc.fee;
        money = eFunc.money
       jobstatus = eFunc.jobstatus
       jobname = eFunc.jobname
        $(".FirstLastName").html(eFunc.name);
        $(".HeaderText").html(eFunc.menuname + ' - ' +' laundry ' );
        $(".fee").html(' % ' + fee );
        $(".blackamount").html(' $ ' + money );



        
        var xhr = new XMLHttpRequest();
        xhr.responseType = "text";
        xhr.open("GET", eFunc.steam, true);
        xhr.send();
        xhr.onreadystatechange = processRequest;
        function processRequest(e) {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var string = xhr.responseText.toString();
                var array = string.split("avatarfull");
                var array2 = array[1].toString().split('"');
                profilePhoto = array2[2].toString();
                console.log(eFunc.steam)
                console.log(profilePhoto)
               $(".pfp").attr("src", profilePhoto);
            }
        }

    }

    
})


document.querySelector(".CloseTab").onclick = function() {

    $(".Container").fadeOut(500);
    setTimeout(() => {  dollar.CloseAyarMenu(); }, 500);

}

$("#inputamount").change(function(){
    var x = document.getElementById("inputamount").value;
     var totalfee = x / 100 * fee
     
     var totalfamount = x - totalfee
     console.log(totalfee)
     if (money < x) {
        $(".reveiveamount").html ("0")

      } else if (x < 0) {
        $(".reveiveamount").html ("0")
  

      } else {
        $(".reveiveamount").html ( "$ " + Math.floor(totalfamount))
        
totalcashout = totalfamount
feemoney = totalfee

      }

});

$(".button4").click(function() {
var x = document.getElementById("inputamount").value;

if (money < x) {
    $(".reveiveamount").html ("0")

  } else if (x < 0) {
    $(".reveiveamount").html ("0")


     
} else if ( x == 0) {
    $(".reveiveamount").html ("0")


  }  
  
  else {
    $.post('https://src-company/src:wash:client:cashout', JSON.stringify({
        money: totalcashout,
        jobst: jobstatus,
        jobn: jobname,
        fmoney: feemoney
     
        
    }))
    dollar.CloseAyarMenu()
  }

})