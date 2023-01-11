clc;
clear;
load basic_data.mat;

W_c = [B, A*B, A^2*B, A^3*B, A^4*B, A^5*B];
C_w = [B(:,1), A*(B(:,1)), (A^2)*(B(:,1)), B(:,2), A*(B(:,2)), (A^2)*(B(:,2))];%d1 = 3, d2 = 3
C_inv = inv(C_w);
T = [C_inv(3, :);
     C_inv(3, :)*A;
     C_inv(3, :)*(A^2);
     C_inv(6, :);
     C_inv(6, :)*A;
     C_inv(6, :)*(A^2)];

A_overbar = T*A*inv(T);
for i = 1 : 6
    for j = 1 : 6
        if abs(A_overbar(i, j)) < 1/2
            A_overbar(i, j) = 0;
        end
    end
end

B_overbar = T*B;
for i = 1 : 6
    for j = 1 : 2
        if abs(B_overbar(i, j)) < 1/2
            B_overbar(i, j) = 0;
        end
    end
end

syms k11_ k12_ k13_ k14_ k15_ k16_
syms k21_ k22_ k23_ k24_ k25_ k26_
K_ = [k11_, k12_, k13_, k14_, k15_, k16_;
      k21_, k22_, k23_, k24_, k25_, k26_];
canonical = A_overbar - B_overbar*K_

%select desired -0.6 -0.6 -1.2 -1.8 -2.4 -3
p = [-1.5 -1.5 -3 -3 -6 -6];
syms s
det_Ad = (s + 1.5)*(s + 1.5)*(s + 3)*(s + 3)*(s + 6)*(s + 6);
det_Ad = expand(det_Ad);

A_d = [0 1 0 0 0 0;
       0 0 1 0 0 0;
       0 0 0 1 0 0;
       0 0 0 0 1 0;
       0 0 0 0 0 1;
       -729 -1701 -1559.2 -715.5 -173.25 -21
      ];

k11_overbar = double(vpa(solve(canonical(3, 1)-A_d(3, 1), k11_)));
k12_overbar = double(vpa(solve(canonical(3, 2)-A_d(3, 2), k12_)));
k13_overbar = double(vpa(solve(canonical(3, 3)-A_d(3, 3), k13_)));
k14_overbar = double(vpa(solve(canonical(3, 4)-A_d(3, 4), k14_)));
k15_overbar = double(vpa(solve(canonical(3, 5)-A_d(3, 5), k15_)));
k16_overbar = double(vpa(solve(canonical(3, 6)-A_d(3, 6), k16_)));
k21_overbar = double(vpa(solve(canonical(6, 1)-A_d(6, 1), k21_)));
k22_overbar = double(vpa(solve(canonical(6, 2)-A_d(6, 2), k22_)));
k23_overbar = double(vpa(solve(canonical(6, 3)-A_d(6, 3), k23_)));
k24_overbar = double(vpa(solve(canonical(6, 4)-A_d(6, 4), k24_)));
k25_overbar = double(vpa(solve(canonical(6, 5)-A_d(6, 5), k25_)));
k26_overbar = double(vpa(solve(canonical(6, 6)-A_d(6, 6), k26_)));

K_overbar = [k11_overbar, k12_overbar, k13_overbar, k14_overbar, k15_overbar, k16_overbar;
             k21_overbar, k22_overbar, k23_overbar, k24_overbar, k25_overbar, k26_overbar]

K = K_overbar*T
K_build = place(A,B,p)


