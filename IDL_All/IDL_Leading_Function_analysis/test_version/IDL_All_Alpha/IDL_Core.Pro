Pro IDL_Core
    time1   =   systime(/seconds)
    Data_Directory          =   'D:\Google Drive\Fast analysis\Data_Analysis\EACF\Old_collisoion_wrong\Old_damp26.2\Basic_data\'
    file_Bash               =   '\file_Bash.txt'
    name_Bash               =   '\name_Bash.txt'
    bash_path               =   file_dirname(routine_filepath('IDL_Core'))
    longest_useful_length   =   10000L
    Absolute_path           =   '   '
    file_path_temp          =   '   '

   
    openr   ,   path_getting    ,   bash_path + file_Bash , /get_lun
        openr   ,   name_getting    ,   bash_path + name_Bash , /get_lun
            readf   ,   path_getting    ,   file_path_temp
            All_sets        =   FILE_LINES(bash_path + file_Bash) 
            All_Parameters  =   FILE_LINES(bash_path + name_Bash)
            name_temp       =   strarr(All_Parameters)
            file_path_temp  =   strarr(All_sets)
            All_data        =   dblarr(All_sets,All_Parameters,longest_useful_length)
        free_lun    ,   name_getting
    free_lun    ,   path_getting
    
    File_Reading    ,   All_data , All_sets , All_Parameters , Data_Directory , file_Bash , name_Bash , bash_path , name_temp , file_path_temp
    Advanced_average_value  , All_data , All_sets , All_Parameters , Data_Directory , name_temp , file_path_temp
    ;CL_LFA          ,   All_data , All_sets , All_Parameters , Data_Directory , name_temp , file_path_temp , mean_of_Leading 
    ; 
         
    time2       =   systime(/seconds)
    time_spend  =   byte( (time2 - time1)/60 )
    print       ,   'All done , and cost' , time_spend , ' minutes.'
    free_lun    ,   path_getting
End


