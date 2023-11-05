function write_lines_to_file(lines)
{
	var f = file_text_open_write("test.txt");
	
	for (var i = 0; i < lines; i++)
	{
		file_text_write_string(f, "cooldata");
	}
	
	file_text_close(f);
	file_delete("text.txt");
}