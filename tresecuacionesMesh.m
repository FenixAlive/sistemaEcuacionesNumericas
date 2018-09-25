% cambiar la separacion para mas precision
x = -3:1:3; 
y = -3:1:3;
[x,y] = meshgrid(x,y);
%despejar la z de las ecuaciónes
z = ((9-3*x+2*y)/4);
z2 = (-4-5*y);
z3 = (4+4*x+3*y)/5;
mesh(x,y,z);
hold on;
mesh(x,y,z2);
hold on;
mesh(x,y,z3);
