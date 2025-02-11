function [sys_f_long,sys_n_long] = ME_401_0007_longitudinal(v)

[navion,f104] = ME_401_0007_navion_f104(v);

% longitudinal dynamics this system is from the notes%
A_f_long = [(f104.z_a/v)  1  (f104.z_u/v)  (-f104.g * sin(f104.a)) ; f104.m_a  f104.m_q  f104.m_u  0 ; f104.x_a  0  f104.x_u  (-f104.g * cos(f104.gamma)) ; 0  1  0  0];
B_f_long = [f104.z_de ; f104.m_de ; f104.x_de ; 0]; 
C_f_long = [1  1  1  1 ; 1  1  1  1 ; 1  1  1  1 ; 1  1  1  1];
D_f_long = [0 ; 0 ; 0 ; 0];
A_n_long = [(navion.z_a/v)  1  (navion.z_u/v)  (-navion.g * sin(navion.a)) ; navion.m_a  navion.m_q  navion.m_u  0 ; navion.x_a  0  navion.x_u  (-navion.g * cos(navion.gamma)) ; 0  1  0  0];
B_n_long = [navion.z_de ; navion.m_de ; navion.x_de ; 0]; 
C_n_long = [1  1  1  1 ; 1  1  1  1 ; 1  1  1  1 ; 1  1  1  1];
D_n_long = [0 ; 0 ; 0 ; 0];
sys_f_long = ss(A_f_long, B_f_long, C_f_long, D_f_long);
sys_n_long = ss(A_n_long, B_n_long, C_n_long, D_n_long);
end