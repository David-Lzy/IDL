Pro CL_LFA , All_data , All_sets , All_Parameters , Data_Directory , name_temp , file_path_temp , mean_of_Leading 
   ;C_Lambda Leadinf Function Analysis
   data_length  = SIZE(All_data[0,0,*], /N_ELEMENTS)
   abs_All_data = abs(All_data)
   abs_C_Lamdba = dblarr(All_sets,data_length)
   data_writing = strarr(All_Parameters)
   openw         , data_building1          ,  Data_Directory + '文字总和.txt' , /get_lun
   ;file_mkdir    , Data_Directory  +  '\'  +  '按照j_set分'
   ;;file_mkdir    , Data_Directory  +  '\'  +  '按照i_Parameter分' 
   ;openw         , data_building2          ,  Data_Directory + 'Anvanced.txt' , /get_lun
   ;openw         , data_building3          ,  Data_Directory + 'Anvanced.txt' , /get_lun
   ;
    for j_set = 0 ,  All_sets - 1  do begin
      for i_Parameter = 1 ,   All_Parameters - 1 do begin
        ;
        ;;  openw , data_writing[i_Parameter] , Data_Directory + '按照i_Parameter分_' + name_temp[i_Parameter] + 'txt' , /get_lun
        ;
        for Tau = 0 ,   data_length - 1 do begin
            abs_C_Lamdba[j_set,Tau] = abs_C_Lamdba[j_set,Tau] + abs_All_data[j_set,i_Parameter,Tau] 
        endfor       
      endfor
      ;abs_C_Lamdba[j_set,*]  = total(abs_All_data[j_set,1:6,*],2)
      ;print , abs_C_Lamdba[j_set,*]
      ;高级用法，选取abs_All_data的第一维度的j_set部分构成2维数组，再选取第二位度第二个到第七个部分，对新数组的第一个维度（旧书组）
      ;（第二个维度）进行求和。
      file_path = Data_Directory + file_path_temp[j_set]
      for i_Parameter = 1 ,   All_Parameters - 1 do begin
        Function_name = name_temp[i_Parameter]
        Sub_Leading_Function_Analysis , abs_All_data[j_set,i_Parameter,*] , abs_C_Lamdba[j_set,*] , Leading_intensity , Leadinding_credibility , mean_of_Leading      
        File_Writing  , Leading_intensity       , 'Leading_Function' , 'intensity'   , file_path , Function_name
        File_Writing  , Leadinding_credibility  , 'Leading_Function' , 'credibility' , file_path , Function_name
      ;  
        printf        , data_building1          , '在',file_path_temp[j_set],'时，',name_temp[i_Parameter],'项占了',mean_of_Leading,'的份额。'
      ;
      ;;  printf        , data_writing[i_Parameter] , mean_of_Leading
      ;     
      endfor
    endfor
    ;
    free_lun      , data_building1
    ;
    ;;for i_Parameter = 1 ,   All_Parameters - 1 do begin
    ;;  free_lun , data_writing[i_Parameter]   
    ;;endfor
    ;
End