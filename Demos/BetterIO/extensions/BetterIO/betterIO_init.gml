#macro BETTERIO_READ 0
#macro BETTERIO_WRITE 1
#macro BETTERIO_APPEND 2

#define betterIO_init
    global.betterIO_files = []
    global.betterIO_openFileCount = 0
    global.betterIO_setting_maxFiles = 32

    if(directory_exists("BetterIO_temp")){
        directory_destroy("BetterIO_temp")
    }
return true


#define betterIO_cleanUp
    if(directory_exists("BetterIO_temp")){
        directory_destroy("BetterIO_temp")
    }
return true


/*
    File info format (Writing):
    {
        FilePath:"path/to/file.txt",
        buffer:buffer,
        FullText:"Text written so far"
        Lines:["Current", "Lines", "Written"]
        Type:"Write/Append"
    }
    File info format (Reading):
    {
        FilePath:"path/to/file.txt",
        FullText:"Full Text In File",
        Lines:["Text", "Split", "At", "Newlines"],
        CurLineNumb:0,
        Type:BETTERIO_READ
    }
*/