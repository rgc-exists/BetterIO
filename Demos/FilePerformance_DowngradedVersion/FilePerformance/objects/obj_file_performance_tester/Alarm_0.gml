if (is_done) return;

has_started = true

if(i < FINAL_TEST_COUNT){
	show_debug_message("Testing " + string(i));
	
	ds_list_add(normal_time, time_call(write_lines_to_file, [i + 1]));
	ds_list_add(buffer_time, time_call(write_lines_to_file_with_buffer, [i + 1]));
	if(i < FINAL_TEST_COUNT - 1){
		i += TEST_INCREMENT
	}
} else {
	is_done = true;
}

alarm[0] = 1