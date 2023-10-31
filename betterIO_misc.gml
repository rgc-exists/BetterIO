#define betterIO_close_file
    var fileid = argument0
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            var buffer = fileInfo.buffer
            if(buffer_exists(buffer)){
                
                if(fileInfo.type == BETTERIO_WRITE){
                    buffer_save(buffer, fileInfo.filePath)
                } else if(fileInfo.type == BETTERIO_APPEND){
                    buffer_save(buffer, fileInfo.filePath)
                }

                buffer_delete(buffer)
            } else {
                show_error("BETTERIO ERROR:\nYou deleted the file's buffer before you closed the file.\nFile ID: " + string(fileid), false)
                return;
            }
            ds_list_destroy(fileInfo.lines)
            global.betterIO_files[fileid] = undefined
            global.betterIO_openFileCount--;
        } else {
            show_error("BETTERIO ERROR:\nCould not close a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not close file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
return;


#define betterIO_get_full_text
    var fileid = argument0
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            return fileInfo.fullText
        } else {
            show_error("BETTERIO ERROR:\nCould not read text from memory for a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not read text from memory for a file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
return;

#define betterIO_get_all_lines
    var fileid = argument0
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            linesCopy = ds_list_create()
            ds_list_copy(linesCopy, fileInfo.lines)
            return linesCopy
        } else {
            show_error("BETTERIO ERROR:\nCould not read lines from memory for a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not read lines from memory for a file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
return;

#define betterIO_get_file_path
    var fileid = argument0
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            return fileInfo.filePath
        } else {
            show_error("BETTERIO ERROR:\nCould not read filePath of a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not read filePath of a file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
return;

#define betterIO_get_open_type
    var fileid = argument0
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            return fileInfo.filePath
        } else {
            show_error("BETTERIO ERROR:\nCould not read filePath of a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not read filePath of a file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
return;

#define betterIO_read_all_text
    var fname = argument0
    if(file_exists(fname)){
        fileBuffer = buffer_load(fname)
        var entireString = buffer_read(fileBuffer, buffer_text)
        buffer_delete(fileBuffer)
        return entireString
    } else {
        show_error("BETTERIO ERROR:\nCould not open file, because the path does not exist.\n" + fname, false)
        return;
    }
return;


#define betterIO_read_all_lines
    var fname = argument0
    if(file_exists(fname)){
        fileBuffer = buffer_load(fname)
        var entireString = buffer_read(fileBuffer, buffer_text)
        buffer_delete(fileBuffer)
        splitLines = string_split(entireString, "\n")
        splitLines_ds = ds_list_create()
        for(var l = 0; l < array_length(splitLines); l++){
            ds_list_add(splitLines_ds, splitLines[l])
        }
        return splitLines_ds
    } else {
        show_error("BETTERIO ERROR:\nCould not open file, because the path does not exist.\n" + fname, false)
        return;
    }
return;
