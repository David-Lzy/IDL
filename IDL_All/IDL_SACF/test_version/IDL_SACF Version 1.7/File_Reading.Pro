Pro File_Reading , All_data , File_path
    common  Basic_data
    common  file_data , Velocity_X , Velocity_Y ,  Kinetic_Energy , Potential_Energy , Collision_XX , Collision_YY , Collision_XY
    Velocity_X          =   0
    Velocity_Y          =   1
    Kinetic_Energy      =   2
    Potential_Energy    =   3
    Collision_XX        =   4
    Collision_YY        =   !NULL
    Collision_XY        =   5
    time1               =   systime(/seconds)
    data_temp           =   dblarr(6,All_Particle_number)
    openr   ,   data_getting    ,   file_path + '2dp_EACF.lammpstrj' , /get_lun   ;get lun 相当于给前面的data_getting一个数值            
        for iframe =0L  ,   All_Frame_number-1 do begin
            Skip_Lun    ,   data_getting   , 9 , /Lines 
            ;print , '1'            
            readf   ,   data_getting ,data_temp
            All_data[ *,All_Particle_number*iframe : All_Particle_number*(iframe+1)-1 ] = data_temp
        endfor
        time2       =   systime(/seconds)
        time_spend  =   ( time2 - time1 )/3600
        print   ,   'Data has been readed, system cost', time_spend , ' hours'
    close       ,   data_getting
End