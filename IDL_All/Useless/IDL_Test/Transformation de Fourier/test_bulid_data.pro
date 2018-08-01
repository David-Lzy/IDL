pro test_bulid_data
  ;ata_test = filepath(‘test.txt’);,Subdirectory=[‘test’,’txt’]
  N = 100
  dat_test = randomu(1,[2,N])*10
  for i=0,N-1 do begin
    x = 2*3.14159*i / N
    dat_test[1,i] = dat_test[1,i] + 200*sin(x) + 100*sin(10*x)
  endfor
  ;print , dat_test
  filepath = 'C:\Users\li199\IDL\Workspace0\Transformation de Fourier\'
  openw,1,filepath+'test.txt'
  ;test=filepath(‘test.txt’,Subdirectory=[];‘examples’,’data’]
  printf ,1, dat_test
  close , 1 
end