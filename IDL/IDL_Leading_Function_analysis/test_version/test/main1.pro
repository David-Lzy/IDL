pro main1
    all_particle_number = 1024L
    all_frame = 999L
    ;data_length = all_particle_number*all_frame
    all_data = dblarr(2,all_particle_number,all_frame)
    location_mean = dblarr(2,all_particle_number)
    openr  ,  data_read  ,  'H:\O_.dat'  ,  /get_lun
    data_temp = dblarr(6,all_particle_number)
    ;data_temp_temp = dblarr(2,1)
      for iframe = 0 , all_frame -1 do begin
        ;for i_particle=0L , all_particle_number-1 do begin    
        ;endfor
        readf  ,  data_read  ,  data_temp
        all_data[*,*,iframe] = data_temp[0:1,*]
      endfor
      for i_particle = 0 ,all_particle_number-1 do begin
        for j = 0 , 1 do begin
          location_mean[j,i_particle] = mean(all_data[j,i_particle,*])
        endfor
      endfor
   ;a =mean(location_mean[1,*])
   ; print  ,  data_read  ,   a
end