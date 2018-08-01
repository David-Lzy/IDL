pro test_get_data,a,b,frames
  filepath = 'C:\Users\li199\IDL\Workspace0\Transformation de Fourier\'
  openr,2,filepath+'test.txt',get_lun
;  a_arr , b_arr = fltarr([300,1])
   a_arr = fltarr(2,100)
;   b_arr = complexarr(a_arr,[100,2])
   Fourier = fltarr(2,100)
   matrix = complexarr(100,100)
   for i=0,99 do begin
    for j=0,99 do begin
      matrix[i,j] = complex(0,1)
    endfor
   endfor
   N = 100L 
   i =  complex(0,1)
   readf , 2 , a_arr
   Fourier = (exp(((-2*i)*3.14159/N)*(matrix)))^a_arr
   print , real_part(Fourier)
   filepath = 'C:\Users\li199\IDL\Workspace0\Transformation de Fourier\'
   openw,3,filepath+'dat_analysis.txt'
   printf ,3,  real_part(Fourier)
   close , 2
   close , 3
;   for  frames = 0L,300L do begin
; endfor
;  print , a_arr

end