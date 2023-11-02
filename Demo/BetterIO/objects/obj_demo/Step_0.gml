if(mode == 1){
	if(cur_time < times_to_do){
		if(test_mode == 1){
			f = file_text_open_write("file.txt")
			cur_time_multiplier = cur_time
		} else {
			cur_time_multiplier = 1
		}
		for(var i = 0; i < cur_time_multiplier * add_each_time; i++){
			file_text_write_string(f, "TEST")
			file_text_writeln(f)
		}
		if(test_mode == 1){
			file_text_close(f)
		}
	}
	if(cur_time <= times_to_do && cur_time > 0){
		array_push(times, delta_time / 1000000)
	}

} else if(mode == 2){
	if(cur_time < times_to_do){
		if(test_mode == 1){
			fB = betterIO_open_write("file2.txt")
			cur_time_multiplier = cur_time
		} else {
			cur_time_multiplier = 1
		}
		for(var i = 0; i < cur_time_multiplier * add_each_time; i++){
			betterIO_write_string(fB, "TEST")
			betterIO_writeln(fB)
		}
		if(test_mode == 1){
			betterIO_close_file(fB)
		}
	}
	if(cur_time <= times_to_do && cur_time > 0){
		array_push(times_B, delta_time / 1000000)
	}

}
if(mode == 2){
	if(cur_time < times_to_do){
		cur_time += 1
	} else {
		mode = 3	
	}
}

if(mode == 1) mode = 2 else if(mode == 2) mode = 1

if(mode == 3){
	file_text_close(f)	
	mode = 4
} else if(mode == 4){
	betterIO_close_file(fB)
	mode = 5
}