Pro IDL_Data_Getting    , file_path , All_data , All_Frame_number , All_Particle_number  
    ;File_Reading    ,   All_data      ,   file_path 
    ;Data_Building   ,   All_data      ,   file_path 

    ;All_Particle_number         =   4096L
    ;All_Frame_number            =   100000UL
    ;interval_of_time_interaval  =   1L
    All_data                =   dblarr(3,All_Frame_number)
    All_data_temp           =   dblarr(6,All_Particle_number)
    heat_flux               =   dblarr(1,All_Frame_number)
    heat_flux_temp          =   dblarr(2,1)



    Velocity_X              =   0
    Velocity_Y              =   1
    Kinetic_Energy          =   2
    Potential_Energy        =   3
    Collision_XX            =   4
    Collision_YY            =   !NULL
    Collision_XY            =   5
    Kinetic_Energy_part     =   0
    Potential_Energy_part   =   1
    Collision_X_part        =   2
 

    openr   ,   data_getting    ,   file_path + '2dp_EACF.lammpstrj' , /get_lun   ;get lun 相当于给前面的data_getting一个数值            
        for iframe =0L  ,   All_Frame_number-1 do begin
            Skip_Lun    ,   data_getting   , 9 , /Lines             
            readf   ,   data_getting ,All_data_temp
            All_data[Kinetic_Energy_part,iframe]    = total(All_data_temp[Velocity_X ,*] * All_data_temp[Kinetic_Energy ,*])
            All_data[Potential_Energy_part,iframe]  = total(All_data_temp[Velocity_X ,*] * All_data_temp[Potential_Energy ,*])
        endfor
        All_data[Potential_Energy_part,*]   =   0.5 * All_data[Potential_Energy_part,*]
    free_lun,   data_getting

    openr   ,   data_getting2    ,   file_path + 'log.lammps' , /get_lun
    Skip_Lun    ,   data_getting2   , 72 , /Lines 
    for iframe =0L  ,   All_Frame_number-1 do begin           
            readf   ,   data_getting    , heat_flux_temp
            All_data[Collision_X_part,iframe]   =   (All_data[Kinetic_Energy_part,iframe] + All_data[Potential_Energy_part,iframe] -   heat_flux_temp[0,0])
    endfor
    free_lun,   data_getting2   


End
