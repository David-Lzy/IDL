Pro Advanced_Writing  , Data_Directory
;Pro File_Writing  , data_to_writ , analysis_path , analysis_name , file_path , Function_name
  ;file_mkdir,     file_path  +  '\'  +  analysis_path
  result_path =   file_path  +  '\'  +  analysis_path  +  '\'  +  analysis_name  +  '_'  +  Function_name  + '.txt'
  openw       ,   data_building1   ,   Data_Directory + 'Anvanced.txt' , /get_lun
  printf      ,   data_building1   ,   '在',file_path_temp[j_set],'时，',,   ,   data_to_writ
  free_lun    ,   data_building1
End
End