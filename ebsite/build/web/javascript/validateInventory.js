/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validateInventory(event)
{
   // event.preventDefault(); // this will prevent the submit event.
    var q = document.cartForm.quan;
    var qArr = [];
    for (var i = 0, ref = qArr.length = q.length; i < ref; i++) {
        qArr[i] = q[i];
    }
    
    var inv =document.cartForm.inventory;
    var iArr =[];
    for (var i = 0, ref = iArr.length = inv.length; i < ref; i++) {
        iArr[i] = inv[i];
        var eq = parseInt(qArr[i].value);
        var ei = parseInt(iArr[i].value);
        if(ei < eq){
            alert("There is not enough inventory");
            document.cartForm.quan[i].focus();
            return false;
        }
        /*else{
            alert("going to check out!");
            document.cartForm.submit();
        }*/
    }
}


