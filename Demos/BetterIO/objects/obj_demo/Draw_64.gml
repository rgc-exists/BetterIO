draw_set_halign(fa_left)
draw_set_valign(fa_top)
if(mode == 0){
	if(test_mode == 0){
		f = file_text_open_write("file.txt")
		fB = betterIO_open_write("file2.txt")
	}
	mode = 1
} else {
	var xx = 0
	var yy = 0
	var prevX = -1
	var prevX = -1
	var prevY = -1
	for(var i = 0; i < min(array_length(times_B), times_to_do - 1); i++){
		xx = i * graph_width_multiplyer
		yy = times_B[i] * graph_height_multiplyer
		if(prevX >= 0 && prevY >= 0){
			draw_set_color(c_white)
			draw_set_alpha(0.5)
			draw_line_width(prevX, room_height - prevY, xx, room_height - yy, 2)
		}
		draw_set_alpha(1)
		draw_set_color(c_red)
		draw_circle(xx, room_height - yy, 3, false)
		prevX = xx
		prevY = yy
	}
	draw_set_color(c_red)
	if(array_length(times_B) > 0){
		draw_text(0, 15, "Regular Method: " + string(times_B[array_length(times_B) - 1]) + " seconds")
	} else {
		draw_text(0, 15, "Regular Method: " + "0 seconds")	
	}
	var xxB = 0
	var yyB = 0
	var prevXB = -1
	var prevXB = -1
	var prevYB = -1
	for(var i = 0; i < min(array_length(times), times_to_do - 1); i++){
		xxB = i * graph_width_multiplyer
		yyB = times[i] * graph_height_multiplyer
		if(prevXB >= 0 && prevYB >= 0){
			draw_set_color(c_white)
			draw_set_alpha(0.5)
			draw_line_width(prevXB, room_height - prevYB, xxB, room_height - yyB, 2)
		}
		draw_set_alpha(1)
		draw_set_color(c_blue)
		draw_circle(xxB, room_height - yyB, 3, false)
		prevX = xxB
		prevY = yyB
	}

	draw_set_color(c_blue)
	if(array_length(times) > 0){
		draw_text(0, 30, "BetterIO: " + string(times[array_length(times) - 1]) + " seconds")
	} else {
		draw_text(0, 30, "BetterIO: " + "0 seconds")	
	}
	draw_set_color(c_black)
	draw_text(0, 0, string(cur_time * add_each_time) + " lines")
	
}

draw_set_alpha(1)
draw_set_halign(fa_right)
draw_set_valign(fa_top)
draw_set_color(c_black)
if(mode >= 4){
	draw_text(room_width, 0, "WRITE TO DISK")
	draw_set_color(c_red)
	draw_text(room_width, 15, string(delta_time / 1000000) + " seconds")
}
if(mode >= 5){
	draw_set_color(c_blue)
	draw_text(room_width, 30, string(delta_time / 1000000) + " seconds")
}