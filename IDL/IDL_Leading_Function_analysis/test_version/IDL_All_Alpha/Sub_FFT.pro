Pro Sub_FFT  ,  Part_data  ,  FFT_data
  data_length     =   SIZE(Part_data, /N_ELEMENTS)
  Integral_data   =   dblarr(data_length)
  FFT_data        =   FFT(Part_data)  
End