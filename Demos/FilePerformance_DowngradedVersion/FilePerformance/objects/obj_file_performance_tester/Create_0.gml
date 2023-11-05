#macro TEST_COUNT 125
#macro TEST_INCREMENT 1000

#macro FINAL_TEST_COUNT (TEST_INCREMENT * TEST_COUNT) + 1

#macro GRAPH_WIDTH_MULTIPLIER 8
#macro GRAPH_HEIGHT_MULTIPLIER 0.4


buffer_time = ds_list_create();
normal_time = ds_list_create();
is_done = false;

function time_call(fn, args)
{
	var start = current_time;
	
	script_execute_ext(fn, args);
	
	return current_time - start;
}

i = TEST_INCREMENT; 

alarm[0] = 60;

has_started = false
