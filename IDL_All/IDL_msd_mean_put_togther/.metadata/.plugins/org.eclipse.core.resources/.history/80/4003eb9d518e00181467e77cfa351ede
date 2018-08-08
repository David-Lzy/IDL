Pro Data_Building   ,   All_data    ,  file_path   ,   name_temp , columns , time , title
    data_length =   SIZE(All_data[0,*,0], /N_ELEMENTS)
    build_data  =   dblarr(columns+1,data_length)
    mean_data   =   mean(All_data, Dimension =3 )
    build_data[0,*] = time
    build_data[1:columns,*] = mean_data
    analysis_path =   file_path + '\mean_' + name_temp + '.txt'
    openw       ,   data_building1   ,   analysis_path , /get_lun , width=400
    printf      ,   data_building1   ,      title
    printf      ,   data_building1   ,      build_data
    free_lun    ,   data_building1
End