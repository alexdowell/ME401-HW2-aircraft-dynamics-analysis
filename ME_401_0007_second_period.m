function [sys_f_sp,sys_n_sp] = ME_401_0007_second_period(v)

[navion,f104] = ME_401_0007_navion_f104(v);

% short period mode dynamics %
    A_f_sp = [(f104.z_a / v) 1;f104.m_a f104.m_q];
    B_f_sp = [f104.z_de ; f104.m_de];
    C_f_sp = [1 1;1 1];
    D_f_sp = [0 ; 0];
    A_n_sp = [(navion.z_a / v) 1; navion.m_a navion.m_q];
    B_n_sp = [navion.z_de ; navion.m_de];
    C_n_sp = [1 1;1 1];
    D_n_sp = [0 ; 0];
    sys_f_sp = ss(A_f_sp, B_f_sp, C_f_sp, D_f_sp);
    sys_n_sp = ss(A_n_sp, B_n_sp, C_n_sp, D_n_sp);
end