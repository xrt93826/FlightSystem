/**
 * 
 */
$(function(){
	$("#navbar").find("a").each(function(index){
		$(this).click(function(){
			$(this).parent().addClass("active").siblings().removeClass("active");
		});
	});
});