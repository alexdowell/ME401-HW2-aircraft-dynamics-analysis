function [sys_f_dr,sys_n_dr] = ME_401_0007_dutch_roll(v)

[navion,f104] = ME_401_0007_navion_f104(v);

% dutch roll mode dynamics %
    A_f_dr = [(f104.y_b/v) (f104.y_p/v) (-(1-(f104.y_r/v))) ; f104.l_b  f104.l_p  f104.l_r ; f104.n_b  f104.n_p  f104.n_r ];
    B_f_dr = [0  (f104.y_da/v) ; f104.l_da  f104.l_dr ; f104.n_da  f104.n_dr];
    C_f_dr = [1 1 1;1 1 1;1 1 1];
    D_f_dr = [0 0;0 0;0 0];
    A_n_dr = [(navion.y_b/v) (navion.y_p/v) (-(1-(navion.y_r/v))) ; navion.l_b  navion.l_p  navion.l_r ; navion.n_b  navion.n_p  navion.n_r ];
    B_n_dr = [0  (navion.y_da/v) ; navion.l_da  navion.l_dr ; navion.n_da  navion.n_dr];
    C_n_dr = [1 1 1;1 1 1;1 1 1];
    D_n_dr = [0 0;0 0;0 0];
    sys_f_dr = ss(A_f_dr, B_f_dr, C_f_dr, D_f_dr);
    sys_n_dr = ss(A_n_dr, B_n_dr, C_n_dr, D_n_dr);
end