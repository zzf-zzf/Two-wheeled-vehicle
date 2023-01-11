function [P,K] = ARE(A,B,Q,R)
n = size(A,1); % number of states
% find n stable eigenvalues and corresponding eigenvectors
gamma = [A -B*inv(R)*B';-Q -A'];
[eigenvector,eigenvalue] = eig(gamma);
stable_eigenvalue = [];
stable_eigenvector = [];
for i = 1:size(eigenvalue,1)
if real(eigenvalue(i,i)) <= 0
stable_eigenvalue = [stable_eigenvalue,eigenvalue(i,i)];
stable_eigenvector = [stable_eigenvector,eigenvector(:,i)];
end
end
V = stable_eigenvector(1:n,:);
W = stable_eigenvector(n+1:2*n,:);
P = real(W*inv(V)); % get the P
K = real(inv(R)*B'*P); % get the feedback gain K