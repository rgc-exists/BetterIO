if (is_done) return;

for (var i = 0; i < 40.000 + 1; i += 1000)
{
	if (keyboard_check_pressed(vk_f1))
	{
		is_done = true;
		break;
	}
	
	show_debug_message("Testing " + string(i));
	
	ds_list_add(normal_time, time_call(write_lines_to_file, [real(i + 1)]));
	ds_list_add(buffer_time, time_call(write_lines_to_file_with_buffer, [real(i + 1)]));
}

is_done = true;