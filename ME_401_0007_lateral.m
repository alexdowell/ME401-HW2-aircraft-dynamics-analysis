function [sys_f_lat,sys_n_lat] = ME_401_0007_lateral(v)

[navion,f104] = ME_401_0007_navion_f104(v);

% lateral dynamics this system is from the data sheet in canvas%
A_f_lat = [(f104.y_b / v) (f104.y_p / v) (-(1-(f104.y_r / v))) ((f104.g * cos(f104.theta)) / v) ; f104.l_b  f104.l_p  f104.l_r  0 ; f104.n_b  f104.n_p  f104.n_r  0 ; 0 1 0 0];
B_f_lat = [0  (f104.y_dr/v) ; f104.l_da  f104.l_dr ; f104.n_da  f104.n_dr ; 0  0];
C_f_lat = [1  1  1  1 ; 1  1  1  1 ; 1  1  1  1 ; 1  1  1  1];
D_f_lat = [0  0 ; 0  0 ; 0  0 ; 0  0];
A_n_lat = [(navion.y_b / v) (navion.y_p / v) (-(1-(navion.y_r / v))) ((navion.g * cos(navion.theta)) / v) ; navion.l_b  navion.l_p  navion.l_r  0 ; navion.n_b  navion.n_p  navion.n_r  0 ; 0 1 0 0];
B_n_lat = [0  (navion.y_dr/v) ; navion.l_da  navion.l_dr ; navion.n_da  navion.n_dr ; 0  0];
C_n_lat = [1  1  1  1 ; 1  1  1  1 ; 1  1  1  1 ; 1  1  1  1];
D_n_lat = [0  0 ; 0  0 ; 0  0 ; 0  0];
sys_f_lat = ss(A_f_lat, B_f_lat, C_f_lat, D_f_lat);
sys_n_lat = ss(A_n_lat, B_n_lat, C_n_lat, D_n_lat);
end