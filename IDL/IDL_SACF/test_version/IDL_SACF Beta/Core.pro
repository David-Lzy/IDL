Pro Core
    time1 = systime(/seconds)
    Common Basic_data , Number_density,All_Particle_number,All_Frame_number,interval_of_time_interaval
        All_Particle_number         = 4096L
        All_Frame_number           = 100000UL
        interval_of_time_interaval  = 1L
        ;All_Frame_number  = Frame_number / interval_of_time_interaval
        ;Weight_of_Particle = 1
        ;kappa              = 2
        File_Reading , All_data
        EACF, Termal_conductivity, All_data
    time2       = systime(/seconds)
    time_spend  = ( time2 - time1 )/3600
    print , 'All done , and cost' , time_spend , ' hours'
End