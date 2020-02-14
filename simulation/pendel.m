

#dt = 0.1
#N=1000
D=10

x = zeros(1,N);
xd = zeros(1,N);
xdd = zeros(1,N);

z = zeros(1,N);
zd = zeros(1,N);
zdd = zeros(1,N);

x(1) = 1;
xd(1) = 1;

for i = 2:N
  xdd(i) = -D * x(i-1);
  xd(i) = xd(i-1) + dt * xdd(i);
  x(i) = x(i-1) + dt * xd(i);
  
  zdd(i) = -D * z(i-1) - 9.81;
  zd(i) = zd(i-1) + dt * zdd(i);
  z(i) = z(i-1) + dt * zd(i);
endfor

plot(x, z)

function retval = step (input1, input2)


endfunction
