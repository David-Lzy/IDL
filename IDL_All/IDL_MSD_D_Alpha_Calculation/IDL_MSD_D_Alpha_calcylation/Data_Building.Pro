Pro Data_Building   ,   All_data  , Absolute_path , file_path , name_temp , columns , time , title , Normalized
    data_length =   SIZE(All_data, /N_ELEMENTS)/columns
    new_all_data=   dblarr(columns+1,data_length)

    for iframe  = 0L  , data_length - 1 do begin
        new_all_data[0,iframe]  = time[0,iframe]         
        for i = 1 , columns  do begin
            new_all_data[i,iframe]  =  All_data[i-1,iframe] / Normalized *100
        endfor
    endfor
    result_path =   file_path + '\normalized_' + name_temp +'.txt'
    openw       ,   data_building1   ,   result_path , /get_lun , width=400
    printf      ,   data_building1   ,      title
    printf      ,   data_building1   ,      new_all_data
    free_lun    ,   data_building1
End