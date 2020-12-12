
%% Rule of mixtures
figure (1);
title("Young's Modulus $|$ RoM","Interpreter","latex");
xlabel("$v_f$","Interpreter","latex");
yyaxis left;
ylabel("Longitudinal $E_1$ [MPa]","Interpreter","latex");
plot(vf,E(:,1));
yyaxis right;
plot(vf,E(:,2));
ylabel("Transversal $E_2$ [MPa]","Interpreter","latex");
saveas(gcf,'Figures/E_ROM.png');

figure (2);
plot(vf,G12);
title("Longitudinal shear Modulus $|$ RoM","Interpreter","latex");
xlabel("$v_f$","Interpreter","latex");
ylabel("$G_{12} [MPa]$","Interpreter","latex");
saveas(gcf,'Figures/G_ROM.png');

%% Homogenitzation method
figure (3);
title("Young's Modulus $|$ Homogenitzation","Interpreter","latex");
xlabel("$v_f$","Interpreter","latex");
yyaxis left;
plot(vf_homog(1:8),E_homog(1,1:8));
ylabel("Longitudinal $E_1$ [MPa]","Interpreter","latex");
yyaxis right;
plot(vf_homog(1:8),E_homog(2,1:8));
ylabel("Transversal $E_2$ [MPa]","Interpreter","latex");
saveas(gcf,'Figures/E_HOMOG.png');

figure (4);
plot(vf_homog(1:8),G_homog(3,1:8));
title("Longitudinal shear Modulus $|$ RoM","Interpreter","latex");
xlabel("$v_f$","Interpreter","latex");
ylabel("$G_{12} [MPa]$","Interpreter","latex");
saveas(gcf,'Figures/G_HOMOG.png');

%% Comparison
figure (5);
yyaxis left;
plot(vf,E(:,1));
title("Homogenization vs Rule of mixtures $|$ $E_1$","Interpreter","latex");
xlabel("$v_f$","Interpreter","latex");
ylabel("$E_1$ - ROM","Interpreter","latex");
yyaxis right;
plot(vf_homog(1:8),E_homog(1,1:8));
ylabel("$E_1$ - HMG","Interpreter","latex");
saveas(gcf,'Figures/E1_COMP.png');

figure (6);
yyaxis left;
plot(vf,E(:,2));
title("Homogenization vs Rule of mixtures $|$ $E_2$","Interpreter","latex");
xlabel("$v_f$","Interpreter","latex");
ylabel("$E_2$ - ROM","Interpreter","latex");
yyaxis right;
plot(vf_homog(1:8),E_homog(2,1:8));
ylabel("$E_2$ - HMG","Interpreter","latex");
saveas(gcf,'Figures/E2_COMP.png');

figure (7);
yyaxis left;
plot(vf,G12);
title("Homogenization vs Rule of mixtures $|$ $G_{12}$","Interpreter","latex");
xlabel("$v_f$","Interpreter","latex");
ylabel("$G_{12}$ - ROM","Interpreter","latex");
yyaxis right;
plot(vf_homog(1:8),G_homog(3,1:8));
ylabel("$G_{12}$ - HMG","Interpreter","latex");
saveas(gcf,'Figures/G_COMP.png');