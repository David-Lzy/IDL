Pro Pro_MSD , location , msd , jump_frame , useful_length , boundary_length , half_boundary_length_square
    msd                 =   dblarr(useful_length)
    data_length         =   SIZE(location, /N_ELEMENTS)
    random_jump_frame   =   byte(randomn(s, useful_length+1) * jump_frame * 0.1 + jump_frame )
    for time_interval   =   1L  ,   useful_length-1   do begin 
        i = 0L
        j = 0L
        this_jump_frame = random_jump_frame[time_interval]
        msd_temp =  dblarr(data_length-time_interval)
        while ( j lt (data_length - time_interval - 1) )  do begin           
            msd_temp[i]   =   (location[j+time_interval]-location[j])^2
            i = i + 1L
            j = j + this_jump_frame
        endwhile
        ;print, msd_temp[0:i-1]
        msd_with_boundary_consider = where( msd_temp[0:i-1] gt half_boundary_length_square , count )
        ;print , msd_with_boundary_consider
        for k = 0L , count - 1L do begin
            temp2 = msd_with_boundary_consider[k]
            temp1 = temp2 * this_jump_frame
            delta = location[temp1+time_interval] - location[temp1]
            if delta lt 0 then begin
                msd_temp[temp2] = (delta + boundary_length)^2
                ;print , msd_temp[temp2]
            endif else begin
                msd_temp[temp2] = (delta - boundary_length)^2
            endelse
        endfor

        msd[time_interval] = mean(msd_temp[0:i-1])
    endfor 
    ;print , 'aaa'
End
















;Pro Pro_MSD , location , msd_temp , jump_frame , useful_length , boundary_length , half_boundary_length_square
;  msd         =   dblarr(useful_length)
;  data_length =   SIZE(location, /N_ELEMENTS)
;  for time_interval   =   1L  ,   useful_length-1   do begin
;    i = 0L
;    j = 0L
;    msd_temp =  dblarr(data_length-time_interval)
;
;    while ( j lt (data_length - time_interval - 1) )  do begin
;      msd_temp[i]   =   (location[j+time_interval]-location[j])^2
;      if  msd_temp[i] gt half_boundary_length_square then begin
;        delta = location[j+time_interval] - location[j]
;        if delta lt 0 then begin
;          msd_temp[i] = (delta + boundary_length)^2
;        endif else begin
;          msd_temp[i] = (delta - boundary_length)^2
;        endelse
;      endif
;      i = i + 1L
;      j = j + jump_frame
;    endwhile
;    ;print , msd_temp
;    ;        msd_with_boundary_consider = where( msd_temp[0:i-1] gt half_boundary_length_square , count )
;    ;        print , count
;    ;        ;print , msd_with_boundary_consider
;    ;        for k = 0L , count - 1L do begin
;    ;            temp2 = msd_with_boundary_consider[k]
;    ;            temp1 = temp2 * jump_frame
;    ;            delta = location[temp1+time_interval] - location[temp1]
;    ;            if delta lt 0 then begin
;    ;                msd_temp[temp2] = (delta + boundary_length)^2
;    ;            endif else begin
;    ;                msd_temp[temp2] = (delta - boundary_length)^2
;    ;            endelse
;    ;        endfor
;
;    msd[time_interval] = mean(msd_temp[0:i-1])
;  endfor
;  ;print , 'aaa'
;End