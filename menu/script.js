$(function() {
    
    function display(bool) {
        if (bool) {
            
            $("#container").show();
            
        } else {
            
            $("#container").hide();     

        }
    }
    display(false);

     // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://zykem_drugdealer/exit', JSON.stringify({}));
            return
        }
    };

var cokeamount = 0;
var weedamount = 0;
var methamount = 0;
var weedlevel = 0;
var cokelevel = 0;
var methlevel = 0;
const modal = document.querySelector(".modal");
//const closeButton = document.querySelector(".close-button");
//closeButton.addEventListener("click", toggleModal);
function toggleModal() {
    modal.classList.toggle("show-modal");
    document.getElementById("container").hidden = true
}



$("#cokesold").click(function() {

  //  document.getElementById("img").innerHTML = "DD"
    document.getElementById('desc').innerHTML = "Sprzedano Kokainy: " + cokeamount
   launch_toast();

})

$("#weedsold").click(function() {

    //document.getElementById("img").innerHTML = "DD"
    document.getElementById('desc').innerText = "Sprzedano Marihuany: " + weedamount
   launch_toast();

})

$("#methsold").click(function() {

    //document.getElementById("img").innerHTML = "DD"
    document.getElementById('desc').innerHTML = "Sprzedano Metaamfetaminy: " + methamount
   launch_toast();

})

$("#weedlvlup").click(function() {

    var data = {

        type: "weed"

    }
    $.post('http://zykem_drugdealer/lvlup', JSON.stringify(data));

})

$("#cokelvlup").click(function() {

    var data = {

        type: "coke"

    }
    $.post('http://zykem_drugdealer/lvlup', JSON.stringify(data));

})

$("#methlvlup").click(function() {

    var data = {

        type: "meth"

    }
    $.post('http://zykem_drugdealer/lvlup', JSON.stringify(data));

})

// listener for profile stats
window.addEventListener('message', function(e) {

    let data = e.data;

    if(e.data.type === "ui") {

        if(data.status == true) {
            display(true)

        } else {

            display(false)

        }

    }

    if(e.data.type == 'LVLUP') {

        var drug = data.drug;
        var lvl = data.lvl;
        if(drug == 'weed') {

            if(lvl == 1) {

                this.document.getElementById('weedrating').className = 'fas fa-star'

            }
            if(lvl == 2) {

                this.document.getElementById('weedrating2').className = 'fas fa-star'

            }
            if(lvl == 3) {

                this.document.getElementById('weedrating3').className = 'fas fa-star'

            }
            if(lvl == 4) {

                this.document.getElementById('weedrating4').className = 'fas fa-star'

            }
            if(lvl == 5) {

                this.document.getElementById('weedrating5').className = 'fas fa-star'

            }

        }

    }

    if(e.data.typeevent == "SELF_UPDATE") {

        
        var drug = data.drug; 
        if(drug == 'weed') {

           // this.document.getElementById('weedsold').title = 'Sprzedano Marihuany: ' + data.amount;
         
            weedamount = data.amount
            if(data.level == 1) {

                this.document.getElementById('weedrating').className = 'fas fa-star'

            } 
            if(data.level == 2) {

                this.document.getElementById('weedrating').className = 'fas fa-star'
                this.document.getElementById('weedrating2').className = 'fas fa-star'

            }
            if(data.level == 3) {

                this.document.getElementById('weedrating').className = 'fas fa-star'
                this.document.getElementById('weedrating2').className = 'fas fa-star'
                this.document.getElementById('weedrating3').className = 'fas fa-star'

            }
            if(data.level == 4) {

                this.document.getElementById('weedrating').className = 'fas fa-star'
                this.document.getElementById('weedrating2').className = 'fas fa-star'
                this.document.getElementById('weedrating3').className = 'fas fa-star'
                this.document.getElementById('weedrating4').className = 'fas fa-star'

            }
            if(data.level == 5) {

                this.document.getElementById('weedrating').className = 'fas fa-star'
                this.document.getElementById('weedrating2').className = 'fas fa-star'
                this.document.getElementById('weedrating3').className = 'fas fa-star'
                this.document.getElementById('weedrating4').className = 'fas fa-star'
                this.document.getElementById('weedrating5').className = 'fas fa-star'

            }
            console.log('changed weedsold to ' + data.amount)


        }

        if(drug == 'coke') {

            cokeamount = data.amount
            console.log('changed cokesold to ' + data.amount)

        }

        if(drug == 'meth') {

            methamount = data.amount
            console.log('changed methsold to ' + data.amount)

        }

    }


})

})