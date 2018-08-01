PRO cs_md_single,files
  
  file_Pxy=files+'\Pxy_Pxy_E_Pxy_P.dat'
  file_Cs=files+'\Cs_minus_average.dat'
  ;file_plus=files+'\about_mean.dat'
  print,file_Pxy,file_Cs
  
  N_frames=700000L
  Pxy_t=dblarr(1,N_frames)                                  ; dblarr(3,N_frames)
  
  read_Pxy_t,Pxy_t,file_Pxy,N_Frames
  
  p_average=0.0D  
  ;p_e_average=0.0D
  ;p_p_average=0.0D
  p_average= MEAN(Pxy_t(0,*))  
 ; p_e_average=MEAN(Pxy_t(1,*))
 ; p_p_average=MEAN(Pxy_t(2,*))
  
  get_Pxy_t,Pxy_t,N_Frames,p_average               ;,p_e_average,p_p_average                   ; Pxy_t=Pxy_t-arerage(Pxy_t)
  
  N_correlation=3000L
  ;N_correlation=10100
  Cs_t=dblarr(1,N_correlation)                      ;dblarr(4,N_correlation)
  get_Cs_t,Pxy_t,N_correlation,N_frames,Cs_t
  
 
  openw,u6,file_Cs,/get_lun,width=100
    torr=0
    for torr=0,N_correlation-1 do printf,u6,torr,'  ',Cs_t(0,torr)    ;,'  ',Cs_t(1,torr),'  ',Cs_t(2,torr),'  ',Cs_t(3,torr)
  free_lun,u6
 
;  openw,u7,file_plus,/get_lun,width=100
;     printf,u7,'p_average=',p_average              ;,'   p_e_average=',p_e_average,'   p_p_average=',p_p_average
;     printf,u7,'p_average*p_average=',p_average*p_average
;     torr=0
;     printf,u7,'Cs+p_average*p_average'
;     for torr=0,N_correlation-1 do printf,u7,torr,'  ',Cs_t(0,torr)+p_average*p_average
;  free_lun,u7
  
return
END 
 
pro read_Pxy_t,Pxy_t,file_Pxy,N_Frames
  openr,u5,file_Pxy,/get_lun
    iframe=0L
    while (eof(u5) ne 1) DO Begin
      t=0L
      p=0.0D
      p_e=0.0D
      p_p=0.0D
      readf,u5,t,p,p_e,p_p
      ;,format='(i12,f13)
      Pxy_t(0,iframe)=p
                            ;      Pxy_t(1,iframe)=p_e
                            ;      Pxy_t(2,iframe)=p_p
      iframe=iframe+1 
      if(iframe ge N_Frames) then goto, jump1
    endwhile
    jump1: print, N_Frames,' have been read in'
  free_lun,u5 
return  
end

pro   get_Pxy_t,Pxy_t,N_Frames,p_average                            ;,p_e_average,p_p_average  
  iframe=0L
    for iframe=0L,N_frames-1 do begin
        Pxy_t(0,iframe)=Pxy_t(0,iframe)-p_average
                                                                    ;Pxy_t(1,iframe)=Pxy_t(1,iframe)-p_e_average
                                                                    ;Pxy_t(2,iframe)=Pxy_t(2,iframe)-p_p_average
    endfor
return         
end 

pro  get_Cs_t,Pxy_t,N_correlation,N_frames,Cs_t
  torr=0
  for torr=0,N_correlation-1 do begin
      iframe=0L
      temp_Cs=0.0D
                                                                    ;temp_Cs_e=0.0D
                                                                    ;temp_Cs_p=0.0D
                                                                    ;temp_Cs_ep=0.0D
      for iframe=0L,N_frames-1-torr do begin
        temp_Cs=temp_Cs+Pxy_t(0,iframe+torr)*Pxy_t(0,iframe)
                                                                      ; temp_Cs_e=temp_Cs_e+Pxy_t(1,iframe+torr)*Pxy_t(1,iframe)
                                                                      ; temp_Cs_p=temp_Cs_p+Pxy_t(2,iframe+torr)*Pxy_t(2,iframe) 
                                                                      ; temp_Cs_ep=temp_Cs_ep+Pxy_t(1,iframe+torr)*Pxy_t(2,iframe)+Pxy_t(1,iframe)*Pxy_t(2,iframe+torr)
      endfor
      Cs_t(0,torr)=temp_Cs/(N_frames-torr)
                                                                      ;      Cs_t(1,torr)=temp_Cs_e/(N_frames-torr)
                                                                      ;      Cs_t(2,torr)=temp_Cs_p/(N_frames-torr)
                                                                      ;      Cs_t(3,torr)=temp_Cs_ep/(N_frames-torr)
      print,torr
  endfor
return  
end  