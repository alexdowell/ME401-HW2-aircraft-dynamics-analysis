figure(1);
title('Roll Dynamics Step Response vs Airspeed for the Navion and F-104A')
xlabel('Time(s)')
ylabel('Roll Dynamics Step Response(rad/s)')
grid
figure(2);
title('Short Period Step Response vs Airspeed for the Navion and F-104A')
xlabel('Time(s)')
ylabel('Short Period Step Response(rad/s)')
grid
figure(3);
title('Dutch Roll Step Response vs Airspeed for the Navion and F-104A')
xlabel('Time(s)')
ylabel('Dutch Roll Step Response(rad/s)')
grid
figure(4);
title('longitudinal Dynamics Step Response vs Airspeed for the Navion and F-104A')
xlabel('Time(s)')
ylabel('longitudinal Dynamics Step Response(rad/s)')
grid
figure(5);
title('lateral Dynamics Step Response vs Airspeed for the Navion and F-104A')
xlabel('Time(s)')
ylabel('lateral Dynamics Step Response(rad/s)')
grid

%
%%
%%% I need to find equations for z_de and x_de before I can start 4th order longitudinal dynamics ???
%%% 4th order lateral dynamics is pending theta_0 ??? 
%%
%

% creating state spaces & step responses for F-104A & Navion %%problem 3 %
for v = [84:30:338]
    [navion,f104] = ME_401_0007_navion_f104(v);
    % roll dynamics %
    sys_f = ss(f104.l_p, f104.l_da, 1, 0);
    step_f = step(sys_f);
    sys_n = ss(navion.l_p, navion.l_da, 1, 0);
    step_n = -step(sys_n);
    % short period mode dynamics %
    A_f_sp = [(f104.z_a / v) 1;f104.m_a f104.m_q];
    B_f_sp = [0 ; 0];
    C_f_sp = [1 1;1 1];
    D_f_sp = [0 ; 0];
    A_n_sp = [(navion.z_a / v) 1; navion.m_a navion.m_q];
    B_n_sp = [0 ; 0];
    C_n_sp = [1 1;1 1];
    D_n_sp = [0 ; 0];
    sys_f_sp = ss(A_f_sp, B_f_sp, C_f_sp, D_f_sp);
    step_f_sp = step(sys_f_sp);
    sys_n_sp = ss(A_n_sp, B_n_sp, C_n_sp, D_n_sp);
    step_n_sp = -step(sys_n_sp);
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
    step_f_dr = step(sys_f_dr);
    sys_n_dr = ss(A_n_dr, B_n_dr, C_n_dr, D_n_dr);
    step_n_dr = -step(sys_n_dr);
    % longitudinal dynamics this system is from the notes%
    A_f_long = [(f104.z_a/v)  1  (f104.z_u/v)  (-f104.g * sin(f104.a)) ; f104.m_a  f104.m_q  f104.m_u  o ; f104.x_a  0  f104.x_u  (-f104.g * cos(f104.gamma)) ; 0  1  0  0];
    B_f_long = [f104.z_de  f104.m_de  f104.x_de  0]; 
    C_f_long = [1  1  1  1 ; 1  1  1  1 ; 1  1  1  1 ; 1  1  1  1];
    D_f_long = [0  0  0  0];
    A_n_long = [(navion.z_a/v)  1  (navion.z_u/v)  (-navion.g * sin(navion.a)) ; navion.m_a  navion.m_q  navion.m_u  o ; navion.x_a  0  navion.x_u  (-navion.g * cos(navion.gamma)) ; 0  1  0  0];
    B_n_long = [navion.z_de  navion.m_de  navion.x_de  0]; 
    C_n_long = [1  1  1  1 ; 1  1  1  1 ; 1  1  1  1 ; 1  1  1  1];
    D_n_long = [0  0  0  0];
    sys_f_long = ss(A_f_long, B_f_long, C_f_long, D_f_long);
    step_f_long = step(sys_f_long);
    sys_n_long = ss(A_n_long, B_n_long, C_n_long, D_n_long);
    step_n_long = -step(sys_n_long);
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
    step_f_lat = step(sys_f_lat);
    sys_n_lat = ss(A_n_lat, B_n_lat, C_n_lat, D_n_lat);
    step_n_lat = -step(sys_n_lat);
    % problem 1 step graphs %
    figure(1);
    hold on
    plot(step_n,'--b')
    plot(step_f,'--r')
    legend({'navion 84-338(ft/s)','F-104 84-338(ft/s)'},'Location','south')
    hold off
    % problem 2 step graphs %
    figure(2);
    hold on
    plot(step_n_sp,'--b')
    plot(step_f_sp,'--r')
    legend({'navion 84-338(ft/s)','F-104 84-338(ft/s)'},'Location','south')
    hold off
    % problem 3 step graphs %
    figure(3);
    hold on
    plot(step_n_dr,'--b') % will not plot all of them ???
    plot(step_f_dr,'--r') % will not plot all of them ???
    legend({'navion 84-338(ft/s)','F-104 84-338(ft/s)'},'Location','south')
    hold off
     % problem 4 step graphs %
    figure(4);
    hold on
    plot(step_n_long,'--b') % will not plot all of them ???
    plot(step_f_long,'--r') % will not plot all of them ???
    legend({'navion 84-338(ft/s)','F-104 84-338(ft/s)'},'Location','south')
    hold off
     % problem 5 step graphs %
    figure(5);
    hold on
    plot(step_n_lat,'--b') % will not plot all of them ???
    plot(step_f_lat,'--r') % will not plot all of them ???
    legend({'navion 84-338(ft/s)','F-104 84-338(ft/s)'},'Location','south')
    hold off
end
