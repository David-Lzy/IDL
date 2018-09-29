Pro Data_Building   ,   All_data    ,     Absolute_path    ,    file_path   ,   name_temp , columns , time , title
    data_length =   SIZE(All_data, /N_ELEMENTS)/columns
    fft_     =   dblarr(columns+1,data_length)
;<<<<<<< HEAD
;    fft_[0,*]  = 0.05 * time[0,0:data_length-1]
;=======
    fft_[0,*]  = time[0,0:data_length-1]
;>>>>>>> a4bcd58f8ae436c37c018109831a98b765d3c875
;    
    temp = dblarr(2*data_length)
    for i = 1 , columns  do begin
      temp  =  FFT(All_data[i-1,*])
      fft_[i,*] = temp[0:data_length-1]
;<<<<<<< HEAD
      location_x = where( fft_[i,*] ge 0.99*max(fft_[i,*]) ) 
;      
;=======
;>>>>>>> a4bcd58f8ae436c37c018109831a98b765d3c875
    endfor
;     
    result_path =   file_path  +  '\'  +  'fft__'  +  name_temp  + '.txt'
    openw       ,   data_building1   ,   result_path , /get_lun , width=400
    printf      ,   data_building1   ,      title
    printf      ,   data_building1   ,      fft_
    free_lun    ,   data_building1
End