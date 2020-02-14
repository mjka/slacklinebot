

#dt = 0.1
#N=1000
D=10
R=1
m=1
I=0.5 * m / (R^2)

x = zeros(1,N);
xd = zeros(1,N);
xdd = zeros(1,N);

z = zeros(1,N);
zd = zeros(1,N);
zdd = zeros(1,N);

b = zeros(1,N);
bd = zeros(1,N);
bdd = zeros(1,N);


z(1) = 0.1;
x(1) = .01;
xd(1) = 0;

for i = 1:N-1
  xdd(i+1) = -D * (x(i) + R * sin(b(i)));
  xd(i+1)  = 0.99*xd(i) + dt * xdd(i+1);
  x(i+1)   = x(i) + dt * xd(i+1);
  
  zdd(i+1) = -D * (z(i) - R *cos(b(i)))  - 9.81;
  zd(i+1)  = 0.99*zd(i) + dt * zdd(i+1);
  z(i+1)   = z(i) + dt * zd(i+1);

  #bdd(i+1) = (z(i) - R * cos(b(i))) * sin(b(i)) + (x(i) - R*sin(b(i))) * cos(b(i));
  fx = x(i)  + R*sin(b(i));
  fz = z(i)  - R*cos(b(i));
  Fx = -D * fx;
  Fz = -D * fz;
  Fr = Fz*sin(b(i)) + Fx*cos(b(i));
  
  bdd(i+1) = Fr / (I *R) - 20*b(i);
  bd(i+1)  = bd(i) + dt * bdd(i+1);
  b(i+1)   = b(i) + dt * bd(i+1);
endfor

hold off
plot(x, z)
hold 
z2 = z - R * cos(b);
x2 = x + R * sin(b);
plot(x2,z2)

function retval = step (input1, input2)


endfunction
