function K = Pole_Placement(A,B,P)
co = poly(P); % characteristic equation with pole P
order = size(A,1); % number of states
Wc = [];
for i = 0 : order-1
Wc = [Wc,A^i*B]; % controllable matrix
end
% apply ackermann's formula
h = zeros(1,order);
h(end) = 1;
S = zeros(order);
for i = 1:order+1
S = S + co(i)*A^(order+1-i);
end
K = h/Wc*S; % feedback gain
end