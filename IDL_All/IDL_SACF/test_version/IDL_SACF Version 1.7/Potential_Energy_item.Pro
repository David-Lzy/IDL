Pro Potential_Energy_item, All_data, Ep_sum_item_x
    common  basic_data
    common  file_data
    time1           =   systime(/seconds)
    Ep_temp         =   dblarr(All_Particle_number)
    Ep_sum_item_x   =   dblarr(All_Frame_number)
    for iframe  = 0L    ,   All_Frame_number - 1 do begin
        l1      =   All_Particle_number * iframe
        for iparticle = 0L  ,   All_Particle_number -1 do begin
            Ep_temp[iparticle]  =  All_data[Velocity_X,iparticle+l1] * All_data[Potential_Energy,iparticle+l1]
        endfor  
        Ep_sum_item_x[iframe]   =  0.5 * total(Ep_temp[*])
    endfor
    time2        =  systime(/seconds)
    time_spend   =  ( time2 - time1 )/3600
    print   ,  'Potential_Energy_item calaulated . and cost ' , time_spend , '  hours'
    openw   ,   data_building1    ,  'C:\Users\li199\Desktop\test15\Ep_sum_item_x.txt'   ,/get_lun
    printf  ,   data_building1 ,   FORMAT='(f0)'   ,     Ep_sum_item_x
    free_lun,   data_building1 
End








;Pro Potential_Energy, All_data, Ep_sum_item_x
;    common basic_data
;    common Column
;    Ep_temp     =   dblarr(All_Particle_number)
;    for iframe  = 0L , All_Frame_number - 1 , interval_of_time_interaval do begin
 ;       Ep_sum_item_x[iframe] = 0.5 * total(All_data[Velocity_X,(All_Particle_number*iframe):(All_Particle_number*(iframe+1) -1)]    *  All_data[Potential_Energy,(All_Particle_number*iframe):(All_Particle_number*(iframe+1) -1)])
 ;   endfor
;End
;这是高级写法，少一个for，然而没有什么卵用，甚至更慢了