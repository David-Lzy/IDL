Pro File_Reading    ,   All_data    ,   Absolute_path   ,   useful_length , columns , time , title
    
    title       =   ''
    time_temp   =   0.0
    time        =   dblarr(1,useful_length)
    data_temp   =   dblarr(columns,1)
        openr   ,   data_getting    ,   Absolute_path   , /get_lun
        ;skip_lun,   data_getting    , 1 , /lines
        readf   ,   data_getting , title
        for Tau =0L  ,   useful_length - 1  do begin
            ;Skip_Lun    ,   data_getting   , 9 , /Lines             
            readf   ,   data_getting    ,   time_temp , data_temp;All_data
            All_data[*,Tau] = data_temp
            time[0,Tau] = time_temp
            ;print   ,   time[0,Tau]
        endfor

    ;time2       =   systime(/seconds)
    ;time_spend  =   ( time2 - time1 )/60
    ;print       ,   'Data has been readed, system cost', time_spend , ' minutes'
    free_lun    ,   data_getting
End