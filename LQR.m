clc;
clear;
load basic_data.mat;

%select Q and R
Q = [100 0 0 0 0 0;
     0 100 0 0 0 0;
     0 0 100 0 0 0;
     0 0 0 100 0 0;
     0 0 0 0 100 0
     0 0 0 0 0 100];
R = [1 0;
     0 1];

cut = [A -B*inv(R)*B'; -Q -A'];
E_v = eig(cut);
E_v_n = [E_v(2) E_v(4) E_v(6) E_v(10) E_v(11) E_v(12)];
[E_ve, Y] = eig(cut);
E_ve_n = [E_ve(:, 2) E_ve(:, 4) E_ve(:, 6) E_ve(:, 10) E_ve(:, 11) E_ve(:, 12)];
V = [E_ve_n(1:6, 1) E_ve_n(1:6, 2) E_ve_n(1:6, 3) E_ve_n(1:6, 4) E_ve_n(1:6, 5) E_ve_n(1:6, 6)];
MU = [E_ve_n(7:12, 1) E_ve_n(7:12, 2) E_ve_n(7:12, 3) E_ve_n(7:12, 4) E_ve_n(7:12, 5) E_ve_n(7:12, 6)];
P = MU * inv(V)

A'*P + P*A + Q - P*B*inv(R)*B'*P
K = inv(R)*B'*P

K_build = lqr(A,B,Q,R)
