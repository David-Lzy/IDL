Pro Sub_Integral  ,  Part_data  ,  integral_data  
    data_length     =   SIZE(Part_data, /N_ELEMENTS)
    Integral_data   =   dblarr(data_length)
    Integral_data   =   total(Part_data,/cumulative)
    ;for iframe  = 0L  , data_length - 1 do begin
    ;    integral_data[iframe]  =  total(Part_data[0:iframe])  
    ;endfor
End