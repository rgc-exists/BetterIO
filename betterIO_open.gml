function betterIO_file_text_open_read(fname){
    if(file_exists(fname)){
        fileBuffer = buffer_load(fname)
        var entireString = buffer_read(fileBuffer, buffer_text)
        splitLines = string_split(entireString, "\n")
        buffer_delete(fileBuffer)
        splitLines_ds = ds_list_create()
        for(var l = 0; l < array_length(splitLines); l++){
            ds_list_add(splitLines_ds, splitLines[l])
        }
        fileInfo = {
            filePath:fname,
            fullText:entireString,
            lines:splitLines_ds,
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

function betterIO_file_text_open_write(fname){
    if(file_exists(fname)){
        fileBuffer = buffer_create(1, buffer_grow, 1)
        fileInfo = {
            filePath:fname,
            buffer_ID:fileBuffer
            fullText:"",
            lines:ds_list_create(),
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
        splitLines_ds = ds_list_create()
        for(var l = 0; l < array_length(splitLines); l++){
            ds_list_add(splitLines_ds, splitLines[l])
        }
        fileInfo = {
            filePath:fname,
            buffer_ID:fileBuffer
            fullText:entireString,
            lines:splitLines_ds,
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

function betterIO_file_text_open_from_string(string){
    splitLines = string_split(string, "\n")
    splitLines_ds = ds_list_create()
    for(var l = 0; l < array_length(splitLines); l++){
        ds_list_add(splitLines_ds, splitLines[l])
    }
    fileInfo = {
        filePath:fname,
        fullText:string,
        lines:splitLines_ds,
        curLineNumb:0,
        type:BETTERIO_READ
    }
    array_push(global.betterIO_files, fileInfo)
    global.betterIO_openFileCount++;
    return array_length(global.betterIO_files - 1)
}