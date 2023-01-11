clc;
clear;
load basic_data.mat;
load L.mat;
S = L;
y_sp = -0.1*C*inv(A)*B*[-0.5+(a-b)/20;0.1+(b-c)/(a+d+10)];
r = y_sp;
A_overbar = [A zeros(6,3);-C zeros(3,3)];
B_overbar = [B;zeros(3,2)];
w = [-1;1];
Bw = [1 0;0 1;0 0;0 0;0 0;0 0];
Bw_overbar = [Bw;zeros(3,2)];
Br_overbar = [zeros(6,3);eye(3,3)];
C_overbar = [C,zeros(3,3)];
Q = 50 * eye(9, 9);
R = 1 * eye(2, 2);
C_1 = [1 0 0 0 0 0 0 0 0;
       0 1 0 0 0 0 0 0 0;
       0 0 1 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0];

[P,L,K] = care(A_overbar,B_overbar,Q,R)
