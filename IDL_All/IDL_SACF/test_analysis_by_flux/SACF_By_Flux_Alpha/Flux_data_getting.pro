Pro Flux_data_Getting   ,   file_path , All_data , All_Frame_number , All_Particle_number , start_point , i_file_number , frame_to_omega 
    ;IDL_Data_Getting    ,   file_path , single_flux_data , Frame_number , All_Particle_number , start_point , i_file_number
    heat_flux_temp = dblarr(2,All_Frame_number)
    openr , data_getting2 , file_path + 'log.lammps'  , /get_lun
    data_temp = dblarr(2,1)
    Skip_Lun    ,   data_getting2   , 78 , /Lines
    skip_lun    ,   data_getting2   , (i_file_number-1) * (All_Frame_number+29) , /Lines
    
    skip_Lun  ,  data_getting2  ,  1 , /Lines
    for iframe = 0L, 10000 - 1 do begin
        readf  ,  data_getting2  ,  data_temp
        All_data[0,iframe] = All_Particle_number /2 * data_temp[1] * frame_to_omega
        ;print , All_data[0,iframe]
    endfor
;
;    if (bool_collision eq 1) then begin
;        All_data[2,*] = -All_data[2,*]
;    endif
    
    ;print , All_data
End