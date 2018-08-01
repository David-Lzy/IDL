Pro Data_Building ,  file_path , All_data , All_Frame_number , useful_length
        Kinetic_Energy_part     =   0
        Potential_Energy_part   =   1
        Collision_X_part        =   2
        Ek_sum_item             =   All_data[Kinetic_Energy_part   ,*]
        Ep_sum_item_x           =   All_data[Potential_Energy_part ,*]
        F_Yukawa_sum            =   All_data[Collision_X_part ,*]
        Autocorrelation_function    ,   C_Lambda_kk     ,   Ek_sum_item       ,   Ek_sum_item       ,   All_Frame_number ,  useful_length
        Autocorrelation_function    ,   C_Lambda_pp     ,   Ep_sum_item_x     ,   Ep_sum_item_x     ,   All_Frame_number ,  useful_length
        Autocorrelation_function    ,   C_Lambda_cc     ,   F_Yukawa_sum      ,   F_Yukawa_sum      ,   All_Frame_number ,  useful_length
        Autocorrelation_function    ,   C_Lambda_kp     ,   Ek_sum_item       ,   Ep_sum_item_x     ,   All_Frame_number ,  useful_length
        Autocorrelation_function    ,   C_Lambda_kc     ,   Ek_sum_item       ,   F_Yukawa_sum      ,   All_Frame_number ,  useful_length
        Autocorrelation_function    ,   C_Lambda_pc     ,   Ep_sum_item_x     ,   F_Yukawa_sum      ,   All_Frame_number ,  useful_length
        buid_data = dblarr( 6,useful_length )
        buid_data[0,*] = C_Lambda_kk
        buid_data[1,*] = C_Lambda_pp
        buid_data[2,*] = C_Lambda_cc
        buid_data[3,*] = C_Lambda_kp
        buid_data[4,*] = C_Lambda_kc
        buid_data[5,*] = C_Lambda_pc
    C_Lambda    =   C_Lambda_kk + C_Lambda_pp + C_Lambda_cc + 2 *( C_Lambda_kc + C_Lambda_pc + C_Lambda_kp )

        openw   ,data_building1              ,   file_path+'C_Lambda.txt'   ,/get_lun
            printf  ,data_building1 ,   FORMAT='(f0)'   ,   C_Lambda
        free_lun,data_building1

        openw   ,data_building2              ,   file_path+'C_Lambda_part.txt',/get_lun , width=400
            printf  ,data_building2 ,   buid_data
        free_lun,data_building2
        ;printf  ,data_building2 , FORMAT = '("The values are: ", 2("<", I1, ">"))',
End
