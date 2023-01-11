clc;
clear;
load lqr.mat;

%% three output are known, then we design (6-3)observer
%G three row three column
syms g11 g12 g13 g21 g22 g23 g31 g32 g33
G = [g11 g12 g13; g21 g22 g23; g31 g32 g33];
%T three row six column
syms t11 t12 t13 t14 t15 t16
syms t21 t22 t23 t24 t25 t26
syms t31 t32 t33 t34 t35 t36
T = [1 0 0 t14 t15 t16;
     0 1 0 t24 t25 t26;
     0 0 1 t34 t35 t36];
%[C;T]rank is six must
%poles 0.7 0.7 1.4 2.1 2.8 3.5
D = [-2 0 0;
     0 -4 0;
     0 0 -8];
[t14,t15,t16,t24,t25,t26,t34,t35,t36,g11,g12,g13,g21,g22,g23,g31,g32,g33] = ...
    solve(D*T - T*A + G*C,t14,t15,t16,t24,t25,t26,t34,t35,t36,g11,g12,g13,g21,g22,g23,g31,g32,g33);
T = double([1 0 0 vpa(t14) vpa(t15) vpa(t16);
     0 1 0 vpa(t24) vpa(t25) vpa(t26);
     0 0 1 vpa(t34) vpa(t35) vpa(t36)]);
G = double([vpa(g11) vpa(g12) vpa(g13); vpa(g21) vpa(g22) vpa(g23); vpa(g31) vpa(g32) vpa(g33)]);
E = double(T*B);
inv_C_T = inv([C;T]);

%% full observer
p = [-2 -2 -4 -4 -8 -8];
v = [1;1;1]; %unity rank method
L = (v*Pole_Placement(A',C'*v,p))' % pole placement
