Pro Kinetic_Energy_item ,   All_data    ,   Ek_sum_item
    common  basic_data
    common  file_data
    time1           =   systime(/seconds)
    Ek_sum_item     =   dblarr(All_Frame_number)
    Ek_temp         =   dblarr(All_Particle_number)
    for iframe = 0L , All_Frame_number - 1   do begin
        l1 = All_Particle_number * iframe
        for  iparticle = 0L  ,   All_Particle_number -1 do begin
            Ek_temp[iparticle] = All_data[Velocity_X,iparticle+l1]  *  All_data[Kinetic_Energy,iparticle]
        endfor   
    Ek_sum_item[iframe]  =  total(Ek_temp[*])
    endfor
    time2       = systime(/seconds)
    time_spend  = ( time2 - time1 )/3600
    print ,  'Kinetic_Energy_item calaulated .  and cost' , time_spend , ' hours'
End
;妈卖批这里采用了高级写法速度反而比for循环慢