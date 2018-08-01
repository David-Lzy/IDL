Pro read_data,xy_t,Vxy_t,N_particles,N_frames,filepath
  
  openr,12,filepath+'O_1.dat',get_lun
  ;openr,lun,filepath+'O_1.dat',/get_lun
  x=0.0
  y=0.0
  vx=0.0
  vy=0.0
  jframe=0L
  for jframe = 0L, N_frames-1 do begin
    iparticle=0L
    for iparticle = 0L, N_Particles-1L do begin
      readf,12,x,y,vx,vy,jframes,iparticles
      if(jframe ge N_frames) then goto, jump1
      xy_t[0,iparticle,jframe]=x
      xy_t[1,iparticle,jframe]=y
      Vxy_t[0,iparticle,jframe]=vx
      Vxy_t[1,iparticle,jframe]=vy
    endfor
  endfor
  close,12
  jump1:print,N_frames,'have been read in'

;  openr,12,filepath+'O_1000001.dat',get_lun
;  for jframe = frames, N_frames-1L do begin
;    iparticle=0L
;    for iparticle = 0L, N_Particles-1L do begin
;      readf,12,x,y,vx,vy,jframes,iparticles
;      if(jframe ge N_Frames) then goto, jump2
;      xy_t[0,iparticle,jframe]=x
 ;     xy_t[1,iparticle,jframe]=y
 ;     Vxy_t[0,iparticle,jframe]=vx
 ;     Vxy_t[1,iparticle,jframe]=vy
      ;print,size(xy_t)
;    endfor
;  endfor
;  close,12
;  jump2: print, N_Frames,' have been read in'
  ;free_lun,lun
end
