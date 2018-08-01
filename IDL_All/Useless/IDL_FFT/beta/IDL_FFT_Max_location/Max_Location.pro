Pro Max_location , All_data , file_path   ,   name_temp , columns , time , title
    location = dblarr(columns)
    for i = 1 , columns do begin
      data_temp = All_data[i-1,*]
      location[i-1] = mean(where(data_temp ge (0.9*max(data_temp)))) 
      print , location[i-1]
    endfor
    result_path =   file_path  +  '\'  +  'FFT_max_locaton'  +  name_temp  + '.txt'
    openw       ,   data_building1   ,   result_path , /get_lun , width=400
    printf      ,   data_building1   ,      title
    printf      ,   data_building1   ,      location
    free_lun    ,   data_building1
    
End