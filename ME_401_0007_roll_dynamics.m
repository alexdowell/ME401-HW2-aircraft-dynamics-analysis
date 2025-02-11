function [sys_f,sys_n] = ME_401_0007_roll_dynamics(v)

[navion,f104] = ME_401_0007_navion_f104(v);

% roll dynamics %
sys_f = ss(f104.l_p, f104.l_da, 1, 0);
sys_n = ss(navion.l_p, navion.l_da, 1, 0);
end