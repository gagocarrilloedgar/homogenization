function [E,nu,G,C] = rule_of_mixtures(MATERIAL)

%% Computation of the final composite properties
% Initialization for a cleaner code
Ef = MATERIAL.FIBER.E(1);
Ef_ = MATERIAL.FIBER.E(2);
Em = MATERIAL.MATRIX.E(1);
vf = MATERIAL.FIBER.VOL;
vm = MATERIAL.MATRIX.VOL;
Gf = MATERIAL.FIBER.Gshear(1);
Gf_ = MATERIAL.FIBER.Gshear(2);
Gm = MATERIAL.MATRIX.Gshear(1);

% Elastics modulus
E(1) = Ef*vf + Em*vm;
E(2) = 1 / ( vf/Ef_ + vm/Em); % 2-3

% Poission ratios
nu(1) = MATERIAL.FIBER.nu(1)*vf + MATERIAL.MATRIX.nu(1)*vm; % 21-31
nu(2) = MATERIAL.FIBER.nu(2)*vf + MATERIAL.MATRIX.nu(1)*vm; % 23-32

% Shear modulus
G(1) = 1/( vf/Gf + vm/Gm); % 13-12
G(2) =  vf*Gf_ + vm*Gm; % 23

C = compute_compliance(E,nu,G);
end

