clc;
clear;
load basic_data.mat;
C_2 = [1 0 0 0 0 0;0 0 1 0 0 0];

%open loop
syms s
G_s = C_2*inv(s*eye(6,6)-A)*B;

%% C_2(1,:)*B == 0 and C_2(2,:)*B == 0
%determine fai
C_2(1,:)*A*B;
fai_1 = 2;
C_2(2,:)*A*B;
fai_2 = 2;

%% 
%determine B* and C*
B_star = [C_2(1,:)*A*B;
          C_2(2,:)*A*B];
C_star = [C_2(1,:)*A*A;
          C_2(2,:)*A*A];
F = inv(B_star);

K = F*C_star;
C_star_star = [C_2(1,:)*(A^2+2.1*A+2.25*eye(6));C_2(2,:)*(A^2+2.1*A+2.25*eye(6))]
K = F*C_star_star;

%% xdot = (A-B*K)x+B*F*u   y = C_2x
A-B*K
B*F
C_2


