Pro IDL_Bash
    time1   =   systime(/seconds)
        useful_length   =   10000L
        columns         =   6
        All_data        =   dblarr(columns,useful_length)
        name_temp       =   '   '
        Absolute_path   =   '   '
        file_path_temp  =   '   '
        file_path       =   '   '
        bash_path       =   file_dirname(routine_filepath('IDL_Bash'))
        openr   ,   path_getting    ,   bash_path + '\file_Bash.txt' , /get_lun
            while   ~eof(path_getting)  do begin
                readf       ,   path_getting    ,   file_path_temp
                    file_path       =   'D:\Google Drive\Fast analysis\Data_Analysis\EACF\' + file_path_temp 
                    openr   ,   name_getting    ,   bash_path + '\name_Bash.txt' , /get_lun
                        for i=0 ,  FILE_LINES(bash_path + '\name_Bash.txt') - 1 do begin     
                            readf               ,   name_getting  ,   name_temp
                            Absolute_path       =   file_path  + '\' +  name_temp + '.txt'
                            File_Reading        ,   All_data  , Absolute_path , useful_length , columns , time , title
                            Data_Building       ,   All_data  , Absolute_path , file_path , name_temp , columns , time , title
                        endfor
                free_lun    ,   name_getting
            endwhile
    time2       =   systime(/seconds)
    time_spend =    STRTRIM(string(long(( time2 - time1 )/3600)),2)
    print       ,   'All done , and cost ' , time_spend , ' seconds.'
    free_lun    ,   path_getting

End


