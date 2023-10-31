function betterIO_file_text_open_write(fname){
    if(file_exists(fname)){
        fileBuffer = buffer_create(1, buffer_grow, 1)
        fileInfo = {
            filePath:fname,
            buffer_ID:fileBuffer
            fullText:"",
            lines:[],
            type:BETTERIO_WRITE
        }
        array_push(global.betterIO_files, fileInfo)
        global.betterIO_openFileCount++;
        return array_length(global.betterIO_files - 1)
    } else {
        show_error("BETTERIO ERROR:\nCould not open file, because the path does not exist.\n" + fname, false)
        return;
    }
}

function betterIO_file_text_open_append(fname){
    if(file_exists(fname)){
        fileBuffer = buffer_load(fname)
        var entireString = buffer_read(fileBuffer, buffer_text)
        splitLines = string_split(entireString, "\n")
        fileInfo = {
            filePath:fname,
            buffer_ID:fileBuffer
            fullText:entireString,
            lines:splitLines,
            type:BETTERIO_APPEND
        }
        array_push(global.betterIO_files, fileInfo)
        global.betterIO_openFileCount++;
        return array_length(global.betterIO_files - 1)
    } else {
        show_error("BETTERIO ERROR:\nCould not open file, because the path does not exist.\n" + fname, false)
        return;
    }
}
function betterIO_file_text_flush(fileid){
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            var buffer = fileInfo.buffer
            if(buffer_exists(buffer)){
                
                if(fileInfo.type == BETTERIO_WRITE || fileInfo.type == BETTERIO_APPEND){
                    buffer_save(buffer, fileInfo.filePath)
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
}


//Writing reals and strings have been condensed into one function.
function betterIO_file_text_write(fileid, val){
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            var buffer = fileInfo.buffer
            if(buffer_exists(buffer)){
                
                if(fileInfo.type == BETTERIO_WRITE || fileInfo.type == BETTERIO_APPEND){
                    fileInfo.fullText += val
                    array_push(fileInfo.lines, val)
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
}

function betterIO_file_text_writeln(fileid){
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            var buffer = fileInfo.buffer
            if(buffer_exists(buffer)){
                
                if(fileInfo.type == BETTERIO_WRITE || fileInfo.type == BETTERIO_APPEND){
                    fileInfo.fullText += "\n"
                    array_push(fileInfo.lines, "\n")
                    buffer_write(fileBuffer, buffer_text, string(va"\n"l))
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
}

function betterIO_file_text_write_all_text(fname, text){
    if(file_exists(fname)){
        fileBuffer = buffer_create(1, buffer_grow, 1)
        buffer_write(fileBuffer, buffer_text, string(text))
        buffer_delete(fileBuffer)
    } else {
        show_error("BETTERIO ERROR:\nCould not open file, because the path does not exist.\n" + fname, false)
        return;
    }
}

function betterIO_file_text_write_all_lines(fname, lines, separator = "\n"){
    if(file_exists(fname)){
        if(is_array(lines)){
            fileBuffer = buffer_create(1, buffer_grow, 1)
            for(var i = 0; i < array_length(lines); i++){
                buffer_write(fileBuffer, buffer_text, string(lines[i]) + separator)
            }
            buffer_delete(fileBuffer)
        } else if(is_real(lines)){
            if(ds_exists(lines, ds_type_list)){
                fileBuffer = buffer_create(1, buffer_grow, 1)
                for(var i = 0; i < ds_list_size(lines); i++){
                    buffer_write(fileBuffer, buffer_text, string(ds_list_find_value(lines, i)) + separator)
                }
                buffer_delete(fileBuffer)
            } else {
                show_error("BETTERIO ERROR:\This function requires an ARRAY or DS LIST of lines, not " + string(typeof(lines)) "\n" + fname, false)
                return;
            }
        } else {
            show_error("BETTERIO ERROR:\This function requires an ARRAY or DS LIST of lines, not " + string(typeof(lines)) "\n" + fname, false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not open file, because the path does not exist.\n" + fname, false)
        return;
    }
}