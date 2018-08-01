Pro Core
    Common Basic_data   ,   Number_density,All_Particle_number,All_Frame_number,interval_of_time_interaval
    time1   =   systime(/seconds)
        All_Particle_number         =   4096L
        All_Frame_number            =   100000UL
        interval_of_time_interaval  =   1L
        bash_path                   =   file_dirname(routine_filepath('Core'))
        file_path_temp              =   ' '
        file_path                   =   ' '
        openr   ,   path_getting    ,   bash_path + '\Bash.txt' , /get_lun 
          while ~eof(path_getting)  do begin
            readf           ,   path_getting  ,   file_path_temp
            file_path       =   'L:\Data\without_analysis' + file_path_temp 
            File_Reading    ,   All_data      ,   file_path 
            EACF            ,   All_data      ,   file_path
          endwhile
        free_lun,  patch_getting
    time2       =   systime(/seconds)
    time_spend  =   ( time2 - time1 )/3600
    print   ,   'All done , and cost '   , time_spend , ' hours.'
End