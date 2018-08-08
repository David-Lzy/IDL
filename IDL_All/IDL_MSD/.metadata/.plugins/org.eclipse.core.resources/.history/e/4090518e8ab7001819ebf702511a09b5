Pro Data_Building   ,  file_path , All_msd_data , useful_length , frame_to_omega

    MSD_X                   =   1
    MSD_Y                   =   2
    MSD_Sum                 =   3

    build_data1             =   dblarr(4,useful_length)
    itime                   =   dindgen(useful_length) 
    itime                   =   itime * frame_to_omega


        build_data1[0,*] = itime
        build_data1[1,*] = All_msd_data[0,*]    
        build_data1[2,*] = All_msd_data[1,*] 
        build_data1[3,*] = All_msd_data[0,*] + All_msd_data[1,*] 

        file_mkdir  ,file_path    
        openw       ,data_building1 ,   file_path + 'MSD.txt'     ,/get_lun , width=400
            Printf  ,data_building1 ,   '            time           MSD_X           MSD_Y           MSD_Sum'
            printf  ,data_building1 ,   build_data1
        free_lun    ,data_building1

        ;printf  ,data_building2 , FORMAT = '("The values are: ", 2("<", I1, ">"))',
End
