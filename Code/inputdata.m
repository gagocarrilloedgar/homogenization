

%% Fiber Inputs 
% Transverse isotropic material
MATERIAL.FIBER.E(1) = 230e3 ; %MPa  % Longitudinal elastic modulus
MATERIAL.FIBER.E(2) = 8e3 ; %MPa   % Transverse elastic modulus
MATERIAL.FIBER.nu(1) = 0.25 ;  % Major poisson's ratio (contraction in the transverse directionupon an extension in the fiber direction)
MATERIAL.FIBER.nu(2) = 0.3 ;  % Transverse poisson's ratio
MATERIAL.FIBER.Gshear(1) = 27.3e3 ; %MPa % In-plane shear modulus
MATERIAL.FIBER.Gshear(2)= 3.08e3 ; % MPa % Transverse shear modulus
MATERIAL.FIBER.INDEX = 1;  % Material index (within GID mesh)
MATERIAL.FIBER.strength = 3730;  % Strenght (MPa)
MATERIAL.FIBER.VOL = 0.4; % Fibre Fraction volume
MATERIAL.FIBER.CONSTITUTIVE_MODEL = 'VONMISES';  % Failure criterion
 
%% Matrix inputs
E = 3e3 ; nu = 0.3 ;
MATERIAL.MATRIX.E(1) = E  ; % MPa Elastic modulus   % MATRIX
MATERIAL.MATRIX.nu(1) = nu ; % Poisson's ratio
MATERIAL.MATRIX.Gshear(1) = E/2/(1+nu)  ;  % In-plane shear modulus
MATERIAL.MATRIX.INDEX =2; % Material index (within GID mesh)
MATERIAL.MATRIX.strength = 64;  % Strenght (MPa)
MATERIAL.MATRIX.CONSTITUTIVE_MODEL = 'VONMISES';  % Failure criterion
MATERIAL.MATRIX.VOL = 0.6; % Matrix Fraction volume

%% --- Macroscopic strains
strainMACRO = zeros(6,1) ;
strainMACRO(1) =0;   % ex
strainMACRO(2) =0;   % ey
strainMACRO(3) =0;   % ez
strainMACRO(4) =0;   % gamma_yz
strainMACRO(5) =0;   % gamma_xz
strainMACRO(6) =0; % gamma_xy

%% DATA
DATA.RECALCULATE_STIFFNESS = 1;   % To avoid computing again the stiffness matrix (if =0) when computing
% the average stresses for different inputDATAdef 
DATA.CALCULATE_STRENGTH = 1 ;   % Calculate "load ratio"
DATA.NUMBER_ELEMENTS_FAIL = 10  ;

%% Homogeneous method
NameFileMesh = ['MESH_0_1.msh';
                'MESH_0_2.msh';
                'MESH_0_3.msh';
                'MESH_0_4.msh';
                'MESH_0_5.msh';
                'MESH_0_6.msh';
                'MESH_0_7.msh';
                'MESH_0_8.msh';
                'MESH_0_9.msh'];
N = size(NameFileMesh,1);
diam = linspace(0.1,0.9,N); % Control size value
Af = pi*(diam/2).^2;
Am = 1-Af;
vf_homog = Af./(Af+Am); % Volum fiber ratio for homogenius method


