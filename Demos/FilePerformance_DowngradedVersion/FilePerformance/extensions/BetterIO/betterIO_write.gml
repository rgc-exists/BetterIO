
#define betterIO_write_real
    var fileid = argument0
    var val = argument1
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            var buffer = fileInfo.buffer
            if(buffer_exists(buffer)){
                
                if(fileInfo.type == BETTERIO_WRITE || fileInfo.type == BETTERIO_APPEND){
                    buffer_write(buffer, buffer_text, string(val) + " ")
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
                    buffer_write(buffer, buffer_text, string(val))
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
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            var buffer = fileInfo.buffer
            if(buffer_exists(buffer)){
                
                if(fileInfo.type == BETTERIO_WRITE || fileInfo.type == BETTERIO_APPEND){
                    buffer_write(buffer, buffer_text, "\n")
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
    var fileBuffer = buffer_create(1, buffer_grow, 1)
    buffer_write(fileBuffer, buffer_text, string(text))
    buffer_save(fileBuffer, fname)
    buffer_delete(fileBuffer)
    return true
return;


#define betterIO_write_all_lines
    var fname = argument0
    var lines = argument1
    if(is_real(lines)){
        if(ds_exists(lines, ds_type_list)){
            var fileBuffer = buffer_create(1, buffer_grow, 1)
            for(var i = 0; i < ds_list_size(lines); i++){
                if(i < ds_list_size(lines) - 1){
                    buffer_write(fileBuffer, buffer_text, string(ds_list_find_value(lines, i)) + "\n")
                } else {
                    buffer_write(fileBuffer, buffer_text, string(ds_list_find_value(lines, i)))
                }
            }
            buffer_save(fileBuffer, fname)
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
return;

#define betterIO_append_all_lines
    var fname = argument0
    var lines = argument1
    if(is_real(lines)){
        if(ds_exists(lines, ds_type_list)){
            
            var splitLines = []
            if(file_exists(fname)){
                var fileBuffer = buffer_load(fname)
                var entireString = ""
                if(buffer_get_size(fileBuffer) > 0){
                    entireString = buffer_read(fileBuffer, buffer_text)
                    splitLines = string_split(entireString, "\n")
                }
                buffer_delete(fileBuffer)
            }
            for(var l = array_length(splitLines) - 1; l >= 0; l--){
                ds_list_insert(lines, 0, splitLines[l])
            }
            var fileBuffer2 = buffer_create(1, buffer_grow, 1)
            for(var i = 0; i < ds_list_size(lines); i++){
                if(i < ds_list_size(lines) - 1){
                    buffer_write(fileBuffer2, buffer_text, string(ds_list_find_value(lines, i)) + "\n")
                } else {
                    buffer_write(fileBuffer2, buffer_text, string(ds_list_find_value(lines, i)))
                }
            }
            buffer_save(fileBuffer2, fname)
            buffer_delete(fileBuffer2)
            return true
        } else {
            show_error("BETTERIO ERROR:\This function requires a DS LIST of lines, not " + string(typeof(lines)) + "\n" + fname, false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\This #define requires a DS LIST of lines, not " + string(typeof(lines)) + "\n" + fname, false)
        return;
    }
return;


#define betterIO_append_all_text
    var fname = argument0
    var text = argument1
    var entireString = ""
    if(file_exists(fname)){
        var fileBuffer = buffer_load(fname)
        entireString = buffer_read(fileBuffer, buffer_text)
        buffer_delete(fileBuffer)
    }
    fileBuffer2 = buffer_create(1, buffer_grow, 1)
    buffer_write(fileBuffer2, buffer_text, entireString + string(text))
    buffer_save(fileBuffer2, fname)
    buffer_delete(fileBuffer2)
    return true
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

