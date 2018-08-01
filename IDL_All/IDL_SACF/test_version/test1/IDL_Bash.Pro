Pro IDL_Bash
    ;common Basic_data , All_Particle_number,All_Frame_number,interval_of_time_interaval
    All_Particle_number         =   4096L
    All_Frame_number            =   1000UL
    useful_length               =   998L
    time1   =   systime(/seconds)
        
        bash_path                   =   file_dirname(routine_filepath('IDL_Bash'))
        file_path_temp              =   ' '
        file_path                   =   ' '
        openr   ,   path_getting    ,   bash_path + '\Bash.txt' , /get_lun 
          while ~eof(path_getting)  do begin
            readf       ,   path_getting  ,   file_path_temp
            file_path   =   'C:\Users\li199\Desktop\' + file_path_temp + '\'  
            IDL_Data_Getting    ,   file_path , All_data , All_Frame_number , All_Particle_number 
            Data_Building       ,   file_path , All_data , All_Frame_number , useful_length    
          endwhile
        free_lun,   path_getting
        
    time2       =   systime(/seconds)
    time_spend  =   ( time2 - time1 )/3600
    print , 'All done , and cost '   , time_spend , ' hours.'
End