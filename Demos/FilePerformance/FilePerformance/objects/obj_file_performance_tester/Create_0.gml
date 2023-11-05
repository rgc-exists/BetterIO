buffer_time = ds_list_create();
normal_time = ds_list_create();
is_done = false;

alarm[0] = 6 * 60;

function time_call(fn, args)
{
	var start = current_time;
	
	script_execute_ext(fn, args);
	
	return current_time - start;
}