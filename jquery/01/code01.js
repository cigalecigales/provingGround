$(function(){
	$('#chk06').change(function(){
		if($(this).is(':checked')){
			$('.chk').removeAttr('disabled');
			$('.chk').removeClass('disabled');
		}else
			$('.chk').attr('disabled', 'disabled');
			$('.chk').addClass('disabled');
	});
});

function switchDisabled(target){
	var $target = target
	if($target.is(':checked')){
		alert("checked!!")
	}
}
