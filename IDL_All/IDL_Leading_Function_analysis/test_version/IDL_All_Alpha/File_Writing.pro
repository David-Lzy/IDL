Pro File_Writing  , data_to_writ , analysis_path , analysis_name , file_path , Function_name
    file_mkdir,     file_path  +  '\'  +  analysis_path 
    result_path =   file_path  +  '\'  +  analysis_path  +  '\'  +  analysis_name  +  '_'  +  Function_name  + '.txt'
    openw       ,   data_building1   ,   result_path , /get_lun
    printf      ,   data_building1   ,   FORMAT='(f0)'   ,   data_to_writ
    free_lun    ,   data_building1
End