Pro Autocorrelation_function, result, sub_function1, sub_function2
    common  basic_data
    common  file_data
    useful_length   =   100L
    time_interval   =   0L
    ifunction       =   dblarr(All_Frame_number-time_interval) ; 用来减少计算量
    result          =   dblarr(useful_length)
    for time_interval   =   0L  ,  useful_length -1  do begin ;通过之前的预实验可知，计算时间关联函数到10000帧已经没有相关性了
        result[time_interval]       =   C_correlate(sub_function1,sub_function2,time_interval)
    endfor 
End