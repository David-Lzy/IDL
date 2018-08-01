pro msd_SD
     starttime=systime(/second) 
     N_Particles=1024L
    ;file=dialog_pickfile(title='Choose project file:')
    ;N_frams=file_lines(file)/1024 
     N_Frames=90001L  ;test change here
     xy_t=fltarr(2,N_particles,N_frames)
     Vxy_t=fltarr(2,N_particles,N_frames)
  
     path=''
     filename='E:\test\path.txt'
     openr,unit,filename,/get_lun
     while ~eof(unit) do begin
     readf,unit,path
         read_data, xy_t,Vxy_t, 1024, N_frames, path
         get_msd,xy_t,Vxy_t, 1024, N_frames, path
     endwhile
        close, unit
    endtime=systime(/second)
    print,'running time is',(endtime-starttime)/60.0
   
end

pro get_MSD,xy_t,Vxy_t, particles, N_frames, filepath
Lx=SQRT(1024/(1.15*0.866))
Ly=0.866*Lx
hLx=0.5*Lx
hLy=0.5*Ly
Ncorr_length=3000L
N_overlapping = 100L
openw,11,filepath+'_MSDx.txt'
openw,12,filepath+'_MSDy.txt'
openw,13,filepath+'_MSD.txt'
for istep = 0L, Ncorr_length-1 do begin
  number_overlap=0.0
  MSDsumx=0.0
  MSDsumy=0.0
  MSDsum=0.0
  for k=0L,long(N_frames-istep-1L),N_overlapping do begin
  MSD_tempx=0.0
  MSD_tempy=0.0
  MSD_temp=0.0
    for iparticle=0,1023 do begin
    deltax=abs(xy_t[0,iparticle,k+istep]-xy_t[0,iparticle,k])
    deltay=abs(xy_t[1,iparticle,k+istep]-xy_t[1,iparticle,k])
    if (deltax gt hLx) then deltax=abs(Lx-deltax)
    if (deltay gt hLy) then deltay=abs(Ly-deltay)
    MSD_tempx = MSD_tempx + deltax*deltax;+deltay*deltay
    MSD_tempy = MSD_tempy + deltay*deltay;+deltay*deltay
    MSD_temp=MSD_tempx+MSD_tempy
    endfor
    ;MSD_temp1 = mean((xy_t[0,*,k+istep]-xy_t[0,*,k])^2+(xy_t[1,*,k+istep]-xy_t[1,*,k])^2)
    ;;v_temp1 = mean(Vxy_t[0,*,k+istep]*Vxy_t[0,*,k])
    ;;v_temp2 = mean(Vxy_t[1,*,k+istep]*Vxy_t[1,*,k])
    MSDsumx=MSDsumx+MSD_tempx
    MSDsumy=MSDsumy+MSD_tempy
    MSDsum=MSDsumx+MSDsumy
    ;vsum2=vsum2+v_temp2
    number_overlap=number_overlap+1.0
  endfor
  printf,11,istep*0.37173,',',MSDsumx/(1024.0*number_overlap);,',',vsum2/number_overlap
  printf,12,istep*0.37173,',',MSDsumy/(1024.0*number_overlap);,',',vsum2/number_overlap
  printf,13,istep*0.37173,',',MSDsum/(1024.0*number_overlap);,',',vsum2/number_overlap
  ;x-axis dimensionless units
  ;printf,11,istep,',',vsum1/number_overlap,',',vsum2/number_overlap
endfor
close,11
close,12
close,13
print, 'End of the calculation for the MSD!'
end