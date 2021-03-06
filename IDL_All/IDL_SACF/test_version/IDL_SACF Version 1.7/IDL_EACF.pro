Pro IDL_EACF
    common Basic_data , All_Particle_number,All_Frame_number,interval_of_time_interaval
    time1   =   systime(/seconds)
        All_Particle_number         =   4096L
        All_Frame_number            =   1000UL
        interval_of_time_interaval  =   1L
        All_data                    =   dblarr(6,All_Particle_number*All_Frame_number)
        bash_path                   =   file_dirname(routine_filepath('IDL_EACF'))
        file_path_temp              =   ' '
        file_path                   =   ' '
        openr   ,   path_getting    ,   bash_path + '\Bash.txt' , /get_lun 
          while ~eof(path_getting)  do begin
            readf           ,   path_getting  ,   file_path_temp
            file_path       =   'C:\Users\li199\Desktop' + file_path_temp + '\'
            File_Reading    ,   All_data      ,   file_path 
            Data_Building   ,   All_data      ,   file_path            
          endwhile
        free_lun,   path_getting
    time2       =   systime(/seconds)
    time_spend  =   ( time2 - time1 )/3600
    print , 'All done , and cost '   , time_spend , ' hours.'
End