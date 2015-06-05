// $(document).ready(function() {
//   // This is called after the document has loaded in its entirety
//   // This guarantees that any elements we bind to will exist on the page
//   // when we try to bind to them

//   // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

//   console.log("ready")


// var defaultLoad = function() {
//   $(".search").on("click", "button", function(event){
    
//     console.log("clicked");
//   });
// }
// });


// $(document).ready(function() {
//   $(".test").addClass('btn-active')

//   $(".formsearch").hide();
//   $(".formcreate").hide();
//   $(".formrandom").hide();
//   $(".formgeneratetests").show();
//   console.log("ready")

//   $(".random").click(function () {
//     $(".test").removeClass('btn-active')

//     $(".formgeneratetests").hide();
//     $(".formcreate").hide();
//     $(".formsearch").hide();
//     $(".formrandom").show();
//     console.log("show random form complete");
//   });

//   $(".search").click(function () {
//     $(".test").removeClass('btn-active')

//     $(".formgeneratetests").hide();
//     $(".formcreate").hide();
//     $(".formrandom").hide();
//     $(".formsearch").show();
//     console.log("show search form complete");
//   });

//   $(".new").click(function () {
//     $(".test").removeClass('btn-active')

//     $(".formgeneratetests").hide();
//     $(".formrandom").hide();
//     $(".formsearch").hide();
//     $(".formcreate").show();
//     console.log("show create form complete");
//   });

//   $(".test").click(function () {
//     $(".test").removeClass('btn-active')
    
//     $(".formcreate").hide();
//     $(".formrandom").hide();
//     $(".formsearch").hide();
//     $(".formgeneratetests").show();
//     console.log("show test form complete");
//   });
// });