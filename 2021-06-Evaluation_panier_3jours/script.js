// JavaScript Document

//une focntion pour console log , tous les items du local storage
function montremoilelocalstorage() {
	var i=0;

console.log("local storage");
for (i = 0; i < localStorage.length; i++)   {
    console.log(localStorage.key(i) + "=[" + localStorage.getItem(localStorage.key(i)) + "]");
}

}