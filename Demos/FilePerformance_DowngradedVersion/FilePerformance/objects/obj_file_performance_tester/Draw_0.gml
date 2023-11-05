for (i2 = 0; i2 < ds_list_size(buffer_time); i2++;)
{
	draw_set_color(c_red);
	if(i2 > 0){
		draw_line_width(i2 * GRAPH_WIDTH_MULTIPLIER, room_height - ds_list_find_value(normal_time, i2 - 1) * GRAPH_HEIGHT_MULTIPLIER, (i2 + 1) * GRAPH_WIDTH_MULTIPLIER, room_height - ds_list_find_value(normal_time, i2) * GRAPH_HEIGHT_MULTIPLIER, 4)
	}
	
	draw_point((i2+ 1) * GRAPH_WIDTH_MULTIPLIER, room_height - ds_list_find_value(normal_time, i2) * GRAPH_HEIGHT_MULTIPLIER);
	draw_set_color(c_blue);
	if(i2 > 0){
		draw_line_width(i2 * GRAPH_WIDTH_MULTIPLIER, room_height - ds_list_find_value(buffer_time, i2 - 1) * GRAPH_HEIGHT_MULTIPLIER, (i2 + 1) * GRAPH_WIDTH_MULTIPLIER, room_height - ds_list_find_value(buffer_time, i2) * GRAPH_HEIGHT_MULTIPLIER, 4)

	}
	draw_point((i2+ 1) * GRAPH_WIDTH_MULTIPLIER, room_height - ds_list_find_value(buffer_time, i2) * GRAPH_HEIGHT_MULTIPLIER);
	

}

if !(has_started) return;

draw_set_color(c_black)
draw_text(0, 0, string(TEST_INCREMENT * (i2 + 1)) + " LINES")

draw_set_color(c_red);
draw_text(0, 15, "GAMEMAKER FUNCTIONS: " + string(ds_list_find_value(normal_time, i2 - 1) / 1000) + " seconds")

draw_set_color(c_blue);
draw_text(0, 30, "BETTERIO: " + string(ds_list_find_value(buffer_time, i2 - 1) / 1000) + " seconds")
