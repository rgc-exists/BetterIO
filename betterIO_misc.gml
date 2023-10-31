function betterIO_file_text_close(fileid){
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
}

function betterIO_get_full_text(fileid){
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
}

function betterIO_get_all_lines(fileid){
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            return fileInfo.lines
        } else {
            show_error("BETTERIO ERROR:\nCould not read lines from memory for a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not read lines from memory for a file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
}

function betterIO_get_file_path(fileid){
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
}

function betterIO_get_open_type(fileid){
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
}
