#macro TEST_COUNT 40
#macro TEST_INCREMENT 1000

#macro FINAL_TEST_COUNT (TEST_INCREMENT * TEST_COUNT) + 1

buffer_time = ds_list_create();
normal_time = ds_list_create();
is_done = false;

function time_call(fn, args)
{
	var start = current_time;
	
	script_execute_ext(fn, args);
	
	return current_time - start;
}