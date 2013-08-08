$(document).ready(function() {
	$("input.tel").mask("(999) 999-9999");
	
	$("div.password.control-group").hide();
	
	$("div.control-group.email input").on('change', function () {
	  $("div.password.user_current_password").show();
	});
	
	$("#change-pw").on('click', function () {
	  $("div.password").show();
	});
});