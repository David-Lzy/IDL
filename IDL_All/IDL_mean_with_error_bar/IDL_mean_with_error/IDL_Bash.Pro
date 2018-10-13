Pro IDL_Bash
    time1   =   systime(/seconds)
        useful_length   =   10000L
        frame_to_omega  =   0.113137

        name_temp       =   ''
        compare_temp    =   ''
        Absolute_path   =   ''
        file_path_temp  =   ''
        file_path       =   ''
        test_temp       =   ''
        bash_path       =   file_dirname(routine_filepath('IDL_Bash'))
        data_location   =   'D:\Google Drive\Fast analysis\Project\Heat_Transport_In_Magnetic_Field\Data\EACF\Archived_Origin_EACF\'
        
        
        
        
        openr   ,   path_getting    ,   bash_path + '\file_Bash.txt' , /get_lun
        while   ~eof(path_getting)  do begin
            readf       ,   path_getting   ,   file_path_temp
            file_path   =   data_location  +   file_path_temp 
                openr   ,   name_getting   ,   bash_path + '\name_Bash.txt' , /get_lun
                name_number =  FILE_LINES(bash_path + '\name_Bash.txt')
                for i=0 ,   name_number - 1 do begin
                    readf   ,   name_getting  ,   name_temp
                    
                        openr   ,   colums_length1,   bash_path + '\compare_Bash.txt' , /get_lun
                        readf   ,   colums_length1,   test_temp
                        openr   ,   colums_length2,   file_path  + '\' + test_temp + '\' + name_temp + '.txt' , /get_lun
                        readf   ,   colums_length2,   test_temp
                        columns =   (strlen((STRJOIN(STRSPLIT(test_temp, /EXTRACT),'')))-4)/2 
                        single_file_data = dblarr(columns,useful_length)
                        mean_data = dblarr(columns,useful_length)
                        compare_times = FILE_LINES(bash_path + '\compare_Bash.txt')
                        All_data=   dblarr(columns,useful_length,compare_times)
                        free_lun,   colums_length1
                        free_lun,   colums_length2
                    
                    openr   ,   compare_getting  , bash_path + '\compare_Bash.txt' , /get_lun
                    comapre_str = sindgen(compare_times)
                    for j=0 , compare_times - 1 do begin
                      
                        readf   ,   compare_getting  ,   compare_temp  
                        comapre_str[j]      =   compare_temp   
                        Absolute_path       =   file_path  + '\' + compare_temp + '\' + name_temp + '.txt'   
                        File_Reading        ,   single_file_data  , Absolute_path , useful_length , columns , time , title
                        All_data[*,*,j]     =   single_file_data    
                           
                    endfor
                    free_lun  , compare_getting
                    ;Data_Building  ,   All_data , file_path , name_temp , columns , title , frame_to_omega
                    Data_Building2  ,   All_data , file_path , name_temp , columns , title , frame_to_omega , comapre_str , file_path_temp
                    ;Data_Building3  ,   All_data , file_path , name_temp , columns , title , frame_to_omega , comapre_str , file_path_temp
                endfor
                free_lun  , name_getting
        endwhile
        free_lun  , path_getting
    time2       =   systime(/seconds)
    time_spend =    STRTRIM(string(long(( time2 - time1 )/1)),2)
    print       ,   'All done , and cost ' ,time_spend , ' seconds.'
    

End


