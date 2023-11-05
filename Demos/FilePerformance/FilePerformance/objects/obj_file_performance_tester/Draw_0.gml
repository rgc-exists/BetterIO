if (!is_done) return;

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

for (var i = 0; i < ds_list_size(buffer_time); i++;)
{
	draw_set_color(c_red);
	draw_point(i + 1, ds_list_find_value(buffer_time, i));
	draw_set_color(c_blue);
	draw_point(i + 1, ds_list_find_value(normal_time, i));
}