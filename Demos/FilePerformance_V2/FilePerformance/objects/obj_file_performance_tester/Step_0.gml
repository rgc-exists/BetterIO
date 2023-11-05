if (is_done) return;

for (var i = TEST_INCREMENT; i < FINAL_TEST_COUNT; i += TEST_INCREMENT)
{	
	show_debug_message("Testing " + string(i));
	
	ds_list_add(normal_time, time_call(write_lines_to_file, [i + 1]));
	ds_list_add(buffer_time, time_call(write_lines_to_file_with_buffer, [i + 1]));
}

is_done = true;