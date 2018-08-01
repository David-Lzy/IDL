Pro Sub_Leading_Function_Analysis , sub_data1 , sub_data2 , Leading_intensity , Leadinding_credibility , mean_of_Leading
    length_temp1      = Size(sub_data1, /N_ELEMENTS)
    length_temp2      = Size(sub_data2, /N_ELEMENTS)
    if ~(length_temp1 eq length_temp2) then begin
        print , 'Warring: Length of two data didn’t match'
    endif
    data_length             =  min(length_temp1,length_temp2)
    Leading_intensity       =  dblarr(data_length)
    Leadinding_credibility  =  dblarr(data_length)
    mean_of_Leading         =  0.0
    abs_sub_data1           =  abs(sub_data1)
    abs_sub_data2           =  abs(sub_data2)
    ;print , abs_sub_data1
    max_abs_sub_data1       =  max(abs_sub_data1)
    max_abs_sub_data2       =  max(abs_sub_data2)
    Leading_intensity       =  alog10( abs_sub_data2 /max_abs_sub_data2 )
    for i = 0L , data_length-1 do begin
      Leading_intensity[i]  =  abs_sub_data2[i] /max_abs_sub_data2 /(1+i/1500)
    endfor    
    Leadinding_credibility  =  (abs_sub_data1+0.00001)/(abs_sub_data2+0.00001) 
    ;print ,  Leadinding_credibility
    mean_of_Leading         =  mean(Leading_intensity*Leadinding_credibility) / mean(Leading_intensity)
    print ,  mean_of_Leading 
End