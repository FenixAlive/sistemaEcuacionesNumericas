%NewtonRaphson Multivariable
syms x;syms y;syms J(x,y);syms F(x,y);
F(x,y) = [exp(-x.^2 - 3*y.^2)-0.007521422474993263; 5*x.^2+3*y.^2-22.53; x.^2+x*y-y.^2-5.09];
x0 = [1;1];
format longG
F1=F(x,y);
Xn = [];
x1=x0;
ErrAbs=1;
J(x,y) = [diff(F1(1),x),diff(F1(1),y); diff(F1(2),x),diff(F1(2),y); diff(F1(3),x),diff(F1(3),y)];
i =0;
while ErrAbs>10^(-6)
    Xn = [Xn;[i x1' ErrAbs]];
    x1 = x0 - inv(double(J(x0(1),x0(2)))'*double(J(x0(1),x0(2)))) * ...
        (double(J(x0(1),x0(2)))' * double(F(x0(1),x0(2))));
    ErrAbs=norm(x0-x1);
    x0=x1;
    i= i+1;
end
Xn