function [C,E,G,nu] = homogenization(strainMACRO,NameFileMesh,MATERIAL, ...
    DATA)

% Initialization
C =zeros(6,6);


for j=1:length(strainMACRO)
    
    strainMACRO(j) = 1;
    
    [stressMACRO DATAOUT DATA]= CompHomog_CF(strainMACRO,NameFileMesh,MATERIAL,DATA) ;
    
    E_ = stressMACRO / strainMACRO;
    
    % Compliance matrix
    C(:,j) = E_(:,j);
    
    % Restore strain matrix as 0
    strainMACRO(j) = 0;
end

% Rearrange compliance matrix
C(6,1:5)=0;
C(5,1:4)=0;
C(6,1:3)=0;
C(1:5,6)=0;
C(1:4,5)=0;
C(1:3,4)=0;

% Compliance matrix for the fiber
S = inv(C);
S_diag = diag(S);

E = 1./S_diag(1:3);
G = 1./S_diag(4:6);

nu(1) = E(1) - S(1,2);
nu(2) = E(2) - S(1,3);
nu(3) = E(3) - S(2,3);

end