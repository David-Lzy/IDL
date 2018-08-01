Pro Getting_Data ,All_data
    common Column, Coordinate_X,Coordinate_Y,Velocity_X, Velocity_Y,Frames,Queue_number, file_path
    Coordinate_X     = 0
    Coordinate_Y     = 1
    Velocity_X          = 2
    Velocity_Y          = 3
    ;Frames               = 4
    ;Queue_number  = 5
    file_path = 'H:\G200K2\'
    common Basic_data
    Data_length = (All_Particle_number)*(All_Frame_number)
        openr,data_getting,file_path+'2dp1.dat',/get_lun;get lun 相当于给前面的data_getting一个数值   
        All_data = fltarr(4,Data_length)
        print , Data_length
        readf,data_getting,All_data

        ;那么比如说第1帧、第233个颗粒、Y方向的速度即为
        ;All_data(Velocity_Y,1*All_Particle_number+233)
  close , data_getting
End

