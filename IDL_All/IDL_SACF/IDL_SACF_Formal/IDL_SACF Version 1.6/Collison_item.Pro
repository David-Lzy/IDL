Pro Collison_item, All_data, F_Yukawa_sum
    common  basic_data
    common  file_data
    time1           =   systime(/seconds)
    F_Yukawa_sum    =   dblarr(All_Frame_number)
    F_Yukawa_temp   =   dblarr(All_Particle_number)
    for iframe = 0L , All_Frame_number - 1  do begin
        l1 = All_Particle_number*iframe
        for iparticle = 0L  ,   All_Particle_number -1 do begin
           F_Yukawa_temp[iparticle]  = All_data[Velocity_X,iparticle+l1]   *  All_data[Collision,iparticle+l1]
        endfor  
        F_Yukawa_sum[iframe]   =  0.5  *  total(F_Yukawa_temp[*])
    endfor
    time2       =   systime(/seconds)
    time_spend  =   ( time2 - time1 )/3600
    print ,  'Collison_item calaulated .  and cost' , time_spend , ' hours'
End