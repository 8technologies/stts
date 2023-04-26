function selectCropVariety(){

    var y = document.getElementById("optionsSelect").value;

    $.ajax({
       url:"show_varieties.php",
       method: "POST",
       data:{
           id: y
       },

        success:function(data) {
           $("#ans").html(data);
        }
    })
}
