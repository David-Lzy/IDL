Pro Autocorrelation_function, result, sub_function1, sub_function2
    print , 'into Autocorrelation_function'
    common basic_data
    common Column
    time_interval = 0L
    ifunction = fltarr(All_Frame_number-time_interval)
    result = fltarr(All_Frame_number)
    for time_interval = 0L, All_Frame_number-1 do begin
        for i = 0L, All_Frame_number - time_interval - 1 do begin
        ifunction[i] = sub_function1[i+time_interval]*sub_function2[i]
        ;print , time_interval
        endfor
        result[time_interval] = mean(ifunction[*])
    endfor 
    ;print, result
    print , 'out Autocorrelation_function'
End