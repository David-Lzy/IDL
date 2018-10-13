Pro test
  omega = 0.1
  length = 1000
  x = findgen(length)
  y = dblarr(length)
  y = sin( 2* 3.141592 * omega * x )
  a = abs(fft(y))
  b = a[0:0.5*length]
  location = mean(where(b ge (0.8*max(b))))  / length 
  Plot, x, a
  print , location
end