function write_lines_to_file_with_buffer(lines)
{
	var f = buffer_create(1, buffer_grow, 1);
	
	for (var i = 0; i < lines; i++)
	{
		buffer_write(f, buffer_string, "cooldata");
	}
	
	buffer_save(f, "test.txt");
	buffer_delete(f);
	file_delete("text.txt");
}