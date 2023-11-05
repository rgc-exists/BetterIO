function write_lines_to_file_with_buffer(lines)
{
	var f = betterIO_open_write("test.txt");
	
	for (var i = 0; i < lines; i++)
	{
		betterIO_write_string(f, "cooldata");
	}
	
	betterIO_close_file(f);
	file_delete("text.txt");
}