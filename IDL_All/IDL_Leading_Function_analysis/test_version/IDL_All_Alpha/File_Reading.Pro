Pro File_Reading    ,   All_data , All_sets , All_Parameters , Data_Directory , file_Bash , name_Bash , bash_path , name_temp , file_path_temp

    Absolute_path   =   ''    
    openr  ,  path_getting  ,  bash_path + file_Bash  ,  /get_lun
    All_sets   =  FILE_LINES(bash_path + file_Bash)
    readf  ,  path_getting  ,  file_path_temp
    for j_set  =  0 ,  All_sets - 1  do begin
        openr  ,  name_getting  ,  bash_path + name_Bash,  /get_lun
        All_Parameters  =  FILE_LINES(bash_path + name_Bash)
        readf  ,  name_getting  ,  name_temp
        for   i_Parameter = 0   ,   All_Parameters - 1  do begin
            Absolute_path =     Data_Directory + file_path_temp[j_set] + '\' + name_temp[i_Parameter] + '.txt'
            openr  ,  data_getting  ,  Absolute_path  ,  /get_lun
            data_length   =  FILE_LINES(Absolute_path)
            for Tau =0L , data_length - 2 do begin
                readf   , data_getting  , data_temp
                All_data[j_set,i_Parameter,Tau]  =  data_temp
                ;print , data_temp
            endfor
            free_lun    ,   data_getting
        endfor    
        free_lun    ,   name_getting
    endfor
    free_lun    ,   path_getting
End