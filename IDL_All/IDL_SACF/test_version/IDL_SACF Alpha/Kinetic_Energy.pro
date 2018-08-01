Pro Kinetic_Energy, All_data, Ek_sum_item
  print , 'into Kinetic_Energy'
  common basic_data
  common Column
    Ek_sum_item = fltarr(All_Frame_number)
    Ek_temp = fltarr(All_Particle_number)
    ;print , l2
       for iframe = 0L , All_Frame_number - 1 do begin
          l1 = All_Particle_number*iframe
          l2 = All_Particle_number*(iframe+1) -1
              for i = 0L, All_Particle_number -1 do begin
                Ek_temp[i] = All_data[Velocity_X,l1+i] * Weight_of_particle * ( All_data[Velocity_X,l1+i]^2  + All_data[Velocity_Y,l1+i]^2 )
              endfor  
          Ek_sum_item[iframe] = 0.5 * total(Ek_temp[*])
      endfor
  print , Ek_sum_item
  print , 'out Kinetic_Energy'
End

;Pro Kinetic_Energy,All_data,Ek
;  common basic_data
;  common Column
;  Ek = fltarr(All_Frame_number -1000)
;  Ekx = fltarr(All_Particle_number,All_Frame_number -1000) 
;  Eky = fltarr(All_Particle_number,All_Frame_number -1000)
;  ;print , l2
;  for iframe = 0L , All_Frame_number - 1001 do begin
;    l1 = All_Particle_number*iframe
;    ;l2 = All_Particle_number*(iframe+1) -1
;    for iparticle = 0L, All_Particle_number - 1 do begin
;      Ekx[iparticle,iframe] = (All_data[Velocity_X,l1+iparticle])^2
;      ;print , Ekx[0,0]
;      Eky[iparticle,iframe] = (All_data[Velocity_y,l1+iparticle])^2
;    endfor
;    Ek[iframe] = 0.5 * Weight_of_particle * ( total(Ekx[*,iframe]) +total(Eky[*,iframe]) )
;    ;print ,total(All_data[Velocity_X,l1:l2]);不知道为什么动能越来越大
;    ;print ,total(All_data[Velocity_X,l1:l2]^2)
;    print ,Ek[iframe]
;  endfor
;End