
form.on('select', function(data) {
    console.log(data.elem); //得到select原始DOM对象
    console.log(data.value); //得到被选中的值]
    $("#batch").val(data.value)
    console.log(data.othis);//得到美化后的DOM对象
}