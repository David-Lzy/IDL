Pro Data_Building   ,   All_data    ,     Absolute_path , file_path , name_temp , columns , time , title , Normalized
    data_length =   SIZE(All_data, /N_ELEMENTS)/columns
    Integral     =   dblarr(columns+1,data_length)
    All_data = All_data * Normalized
    for iframe  = 0L  , data_length - 1 do begin
      Integral[0,iframe]  = time[0,iframe]
      for i = 1 , columns  do begin
        Integral[i,iframe]  =  total(All_data[i-1,0:iframe])  
      endfor 
    endfor
;<<<<<<< HEAD
;
;    ;Integral[1:*,*] = Integral[1:*,*] *100L;修复上次Gamma获取少了10倍的错误，用完记得备注掉
;=======
;    
;    Integral[1:*,*] = Integral[1:*,*] *100L;修复上次Gamma获取少了10倍的错误，用完记得备注掉
;>>>>>>> a4bcd58f8ae436c37c018109831a98b765d3c875
   
    
    result_path =   file_path  +  '\'  +  'Integral_'  +  name_temp  + '.txt'
    openw       ,   data_building1   ,   result_path , /get_lun , width=400
    printf      ,   data_building1   ,      title
    printf      ,   data_building1   ,      Integral
    free_lun    ,   data_building1
End