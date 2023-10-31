
#define betterIO_write_real
    var fileid = argument0
    var val = argument1
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            var buffer = fileInfo.buffer
            if(buffer_exists(buffer)){
                
                if(fileInfo.type == BETTERIO_WRITE || fileInfo.type == BETTERIO_APPEND){
                    fileInfo.fullText += val
                    ds_list_add(fileInfo.lines, val)
                    buffer_write(fileBuffer, buffer_text, string(val))
                } else {
                    show_error("BETTERIO ERROR:\nFile is not open for writing or appending.\nFile ID: " + string(fileid), false)
                    return;
                }

            } else {
                show_error("BETTERIO ERROR:\nYou deleted the file's buffer before you attempted to write to the file.\nFile ID: " + string(fileid), false)
                return;
            }
        } else {
            show_error("BETTERIO ERROR:\nCould not write to a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not write to file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
return;


#define betterIO_write_string
    var fileid = argument0
    var val = argument1
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            var buffer = fileInfo.buffer
            if(buffer_exists(buffer)){
                
                if(fileInfo.type == BETTERIO_WRITE || fileInfo.type == BETTERIO_APPEND){
                    fileInfo.fullText += val
                    ds_list_add(fileInfo.lines, val)
                    buffer_write(fileBuffer, buffer_text, string(val))
                    return true
                } else {
                    show_error("BETTERIO ERROR:\nFile is not open for writing or appending.\nFile ID: " + string(fileid), false)
                    return;
                }

            } else {
                show_error("BETTERIO ERROR:\nYou deleted the file's buffer before you attempted to write to the file.\nFile ID: " + string(fileid), false)
                return;
            }
        } else {
            show_error("BETTERIO ERROR:\nCould not write to a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not write to file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
return;


#define betterIO_writeln
    var fileid = argument0
    var val = argument1
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            var buffer = fileInfo.buffer
            if(buffer_exists(buffer)){
                
                if(fileInfo.type == BETTERIO_WRITE || fileInfo.type == BETTERIO_APPEND){
                    fileInfo.fullText += "\n"
                    ds_list_add(fileInfo.lines, "\n")
                    buffer_write(fileBuffer, buffer_text, "\n")
                    return true
                } else {
                    show_error("BETTERIO ERROR:\nFile is not open for writing or appending.\nFile ID: " + string(fileid), false)
                    return;
                }

            } else {
                show_error("BETTERIO ERROR:\nYou deleted the file's buffer before you attempted to write a newline to the file.\nFile ID: " + string(fileid), false)
                return;
            }
        } else {
            show_error("BETTERIO ERROR:\nCould not write newline to a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not write newline to file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
return;


#define betterIO_write_all_text
    var fname = argument0
    var text = argument1
    if(file_exists(fname)){
        fileBuffer = buffer_create(1, buffer_grow, 1)
        buffer_write(fileBuffer, buffer_text, string(text))
        buffer_save(buffer, fname)
        buffer_delete(fileBuffer)
        return true
    } else {
        show_error("BETTERIO ERROR:\nCould not open file, because the path does not exist.\n" + fname, false)
        return;
    }
return;


#define betterIO_write_all_lines
    var fname = argument0
    var lines = argument1
    var separator="\n"
    if(!is_undefined(argument2)){
        separator = argument2
    }
    if(file_exists(fname)){
        if(is_real(lines)){
            if(ds_exists(lines, ds_type_list)){
                fileBuffer = buffer_create(1, buffer_grow, 1)
                for(var i = 0; i < ds_list_size(lines); i++){
                    buffer_write(fileBuffer, buffer_text, string(ds_list_find_value(lines, i)) + separator)
                }
                buffer_save(buffer, fname)
                buffer_delete(fileBuffer)
                return true
            } else {
                show_error("BETTERIO ERROR:\This #define requires a DS LIST of lines, not " + string(typeof(lines)) + "\n" + fname, false)
                return;
            }
        } else {
            show_error("BETTERIO ERROR:\This #define requires a DS LIST of lines, not " + string(typeof(lines)) + "\n" + fname, false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not open file, because the path does not exist.\n" + fname, false)
        return;
    }
return;



#define betterIO_flush
    var fileid = argument0
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            var buffer = fileInfo.buffer
            if(buffer_exists(buffer)){
                
                if(fileInfo.type == BETTERIO_WRITE || fileInfo.type == BETTERIO_APPEND){
                    buffer_save(buffer, fileInfo.filePath)
                    return true
                } else {
                    show_error("BETTERIO ERROR:\nFile is not open for writing or appending.\nFile ID: " + string(fileid), false)
                    return;
                }
            } else {
                show_error("BETTERIO ERROR:\nYou deleted the file's buffer before you flushed the file.\nFile ID: " + string(fileid), false)
                return;
            }
        } else {
            show_error("BETTERIO ERROR:\nCould not flush a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not flush file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
return;

