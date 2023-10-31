
#define betterIO_read_string 
    var fileid = argument0
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            if(fileInfo.type == BETTERIO_READ){
                if(fileInfo.curLineNumb >= ds_list_size(fileInfo.lines) - 1){
                    var lineString = ""
                } else {
                    var lineString = ds_list_find_value(fileInfo.lines, fileInfo.curLineNumb)
                    return lineString
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
return;


#define betterIO_read_real
    var fileid = argument0
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            if(fileInfo.type == BETTERIO_READ){
                if(fileInfo.curLineNumb >= ds_list_size(fileInfo.lines) - 1){
                    var lineString = ""
                } else {
                    var lineString = ds_list_find_value(fileInfo.lines, fileInfo.curLineNumb)
                    try {
                        return real(lineString)
                    } catch {
                        show_error("BETTERIO ERROR:\nThe line you read is not able to be converted to a real. (It is not a number.)\nFile ID: " + string(fileid), false)
                        return;
                    }
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
return;
    

#define betterIO_readln
    var fileid = argument0
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            if(fileInfo.type == BETTERIO_READ){
                fileInfo.curLineNumb++;
                return true
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
return;
    



#define betterIO_read_previousln
    var fileid = argument0
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            if(fileInfo.type == BETTERIO_READ){
                fileInfo.curLineNumb--;
                return true
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
return;


#define betterIO_eof
    var fileid = argument0
    if(fileid < array_length(global.betterIO_files)){
        var fileInfo = global.betterIO_files[fileid]
        if(!is_undefined(fileInfo)){
            if(fileInfo.type == BETTERIO_READ){
                return fileInfo.curLineNumb >= ds_list_size(fileInfo.lines) - 1
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
return;
