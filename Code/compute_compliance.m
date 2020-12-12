function C = compute_compliance(E,nu,G)

% Matrix values
k1 = 1/E(1);
k2 = -nu(1)/E(1);
k3 = -nu(1)/E(1);
k4 = 1/E(2);
k5 = -nu(2)/E(2);

k6 = 1/E(2);
k7 = 1/G(2);
k8 = 1/G(1);
k9 = 1/G(1);

S = zeros(6,6);

S(1,2) = k2;
S(1,3) = k3;

S(2,1) = S(1,2);
S(2,3) = k5;

S(3,1) = S(1,3);
S(3,2) = S(2,3);

S(1,1) = k1;
S(2,2) = k4;
S(3,3) = k6;
S(4,4) = k7;
S(5,5) = k8;
S(6,6) = k9;

C = inv(S);

end