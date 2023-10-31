function betterIO_file_text_open_read(fname){
    if(file_exists(fname)){
        fileBuffer = buffer_load(fname)
        var entireString = buffer_read(fileBuffer, buffer_text)
        splitLines = string_split(entireString, "\n")
        buffer_delete(fileBuffer)
        fileInfo = {
            filePath:fname,
            fullText:entireString,
            lines:splitLines,
            curLineNumb:0,
            type:BETTERIO_READ
        }
        global.betterIO_openFileCount++;
        if(global.betterIO_openFileCount > global.betterIO_setting_maxFiles){
            show_error("BETTERIO ERROR:\nToo many files opened at once. If you would like to open more than " + string(global.betterIO_setting_maxFiles) + " files, please change the global.betterIO_setting_maxFiles variable.", true)
        }
        array_push(global.betterIO_files, fileInfo)
        return array_length(global.betterIO_files - 1)
    } else {
        show_error("BETTERIO ERROR:\nCould not open file, because the path does not exist.\n" + fname, false)
        return;
    }
}

function betterIO_file_text_read_string(fileid){
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            if(fileInfo.type == BETTERIO_READ){
                var lineString = fileInfo.lines[fileInfo.curLineNumb]
                return lineString
            } else {
                show_error("BETTERIO ERROR:\nFile is not open for reading.\nFile ID: " + string(fileid), false)
                return;
            }
        } else {
            show_error("BETTERIO ERROR:\nCould not read from a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not read from file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
}

function betterIO_file_text_read_real(fileid){
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            if(fileInfo.type == BETTERIO_READ){
                var lineString = fileInfo.lines[fileInfo.curLineNumb]
                try {
                    return real(lineString)
                } catch {
                    show_error("BETTERIO ERROR:\nThe line you read is not able to be converted to a real. (It is not a number.)\nFile ID: " + string(fileid), false)
                    return;
                }
            } else {
                show_error("BETTERIO ERROR:\nFile is not open for reading.\nFile ID: " + string(fileid), false)
                return;
            }
        } else {
            show_error("BETTERIO ERROR:\nCould not read from a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not read from file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
}

function betterIO_file_text_readln(fileid){
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            if(fileInfo.type == BETTERIO_READ){
                fileInfo.curLineNumb++;
                return lineString
            } else {
                show_error("BETTERIO ERROR:\nFile is not open for reading.\nFile ID: " + string(fileid), false)
                return;
            }
        } else {
            show_error("BETTERIO ERROR:\nCould not read from a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not read from file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
}



function betterIO_file_text_read_previousln(fileid){
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            if(fileInfo.type == BETTERIO_READ){
                fileInfo.curLineNumb--;
                return lineString
            } else {
                show_error("BETTERIO ERROR:\nFile is not open for reading.\nFile ID: " + string(fileid), false)
                return;
            }
        } else {
            show_error("BETTERIO ERROR:\nCould not read from a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not read from file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
}


function betterIO_file_text_open_from_string(string){
    splitLines = string_split(string, "\n")
    fileInfo = {
        filePath:fname,
        fullText:string,
        lines:splitLines,
        curLineNumb:0,
        type:BETTERIO_READ
    }
    array_push(global.betterIO_files, fileInfo)
    global.betterIO_openFileCount++;
    return array_length(global.betterIO_files - 1)
}


function file_text_eof(fileid){
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            if(fileInfo.type == BETTERIO_READ){
                return fileInfo.curLineNumb >= array_length(fileInfo.lines) - 1
            } else {
                show_error("BETTERIO ERROR:\nFile is not open for reading.\nFile ID: " + string(fileid), false)
                return;
            }
        } else {
            show_error("BETTERIO ERROR:\nCould not check if you are at the end of a file that is already closed.\nFile ID: " + string(fileid), false)
            return;
        }
    } else {
        show_error("BETTERIO ERROR:\nCould not check if you are at the end of a file, because the file has not been initiated yet.\nFile ID: " + string(fileid), false)
        return;
    }
}