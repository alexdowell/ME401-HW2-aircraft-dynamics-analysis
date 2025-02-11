
v = 84;

[sys_f,sys_n] = ME_401_0007_roll_dynamics(v);
[sys_f_sp,sys_n_sp] = ME_401_0007_second_period(v);
[sys_f_dr,sys_n_dr] = ME_401_0007_dutch_roll(v);
[sys_f_long,sys_n_long] = ME_401_0007_longitudinal(v);
[sys_f_lat,sys_n_lat] = ME_401_0007_lateral(v);
roll_dynamics_pole = pole(sys_n)
sys_n
second_period_poles = pole(sys_n_sp)
sys_n_sp
dutch_roll_poles = pole(sys_n_dr)
sys_n_dr
longitudinal_poles = pole(sys_n_long)
sys_n_long
lateral_poles = pole(sys_n_lat)
sys_n_lat
