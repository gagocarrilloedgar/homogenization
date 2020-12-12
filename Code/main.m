clc
clear all

%% Input data
inputdata

%% Rule of mixtures
vf = linspace(0,1,20);
vm = 1-vf;

% Initialization
E = zeros(size(vf,2),2);
G12 = zeros(size(vf,2),1);

% This for could be vectorized but as the distribution does not neet to be
% to large it is not necessary to optimize it.

for i = 1:size(vf,2)
    MATERIAL.FIBER.VOL = vf(i);
    MATERIAL.MATRIX.VOL = vm(i);
    
    [E_,nu,G,~] = rule_of_mixtures(MATERIAL);
    
    %Saving the values
    E(i,1) = E_(1);
    E(i,2) = E_(2);
    G12(i,1) = G(1);
end


%% Homogeneization method
% Initialization
C_homog =zeros(6,6,N);
E_homog = zeros(3,N);
nu_homog = zeros(3,N);
G_homog = zeros(3,N);

% Core
for i=1:N
    [C,E,G,nu] = homogenization(strainMACRO,NameFileMesh(i,:),MATERIAL,DATA);
    C_homog(:,:,i) = C;
    E_homog(:,i) = E;
    nu_homog(:,i) = nu;
    G_homog(:,i) = G;
end


%% 4 Cell computation using homogenization

Name4Cells = '4cells_06.msh';
[C_4,E_4,G_4,nu_4] = homogenization(strainMACRO,Name4Cells,MATERIAL,DATA);

%% Plots
postprocess
