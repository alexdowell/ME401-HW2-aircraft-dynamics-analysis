function [navion,f104] = ME_401_0007_navion_f104(v)

% navion %
navion.g = 32.174; % (ft/s^2) gravity 
navion.rho = .0023769; % (slugs/ft^3) air density at sea level and 60 deg F
navion.da = deg2rad(25); % maximum aileron deflection
navion.a = 0; % (rad) assuming a wind angle of 0 rad 
navion.gamma = 0; % (rad) assuming a wind angle relative to earth of 0 rad 
navion.theta = navion.a + navion.gamma; % (rad)
navion.s = 184; % (ft^2) wing surface area 
navion.b = 33.4; % (ft) wing span
navion.c_bar = 5.7; % (ft) mean coord
navion.w_lbs = 2750; % (lbs) weight
navion.w_slugs = navion.w_lbs / 32.174 ; % (slugs) weight
navion.I_x = 1048; % (slugs/ft^2) mass moment of inertia x
navion.I_y = 3000; % (slugs/ft^2) mass moment of inertia y
navion.I_z = 3530; % (slugs/ft^2) mass moment of inertia z
navion.I_x_wingtips =7003; %I_x_n +(.125 *w_n_slugs)*((b_n/2)^2); % (slugs/ft^2) mass moment of inertia x when fuel is in the wingtips
% navion derivatives %
navion.m_long = .158;
navion.c_l = .41;
navion.c_l0 = 0;
navion.c_lu = 0;
navion.c_d = .05;
navion.c_d0 = 0;
navion.c_du = 0;
navion.c_la = 4.44;
navion.c_da = .33;
navion.c_ma = -.683;
navion.c_mu = 0; 
navion.c_la_dot = 0;
navion.c_ma_dot = -4.36;
navion.c_lq = 3.8;
navion.c_mq =-9.96 ;
navion.c_lm = 0;
navion.c_dm = 0;
navion.c_mm = 0;
navion.c_lde = .355;
navion.c_mde = -.923;
navion.m_lat = .158;
navion.c_yb = -.564;
navion.c_yp = 0; 
navion.c_yr = 0; 
navion.c_yda = 0;  
navion.c_lb = -.074;
navion.c_nb = -.071;
navion.c_lp = -.410; % roll damping stability derivative
navion.c_np = -.0575;
navion.c_lr = .107;
navion.c_nr = -.125;
navion.c_lda = -.134; % aileron effectiveness control derivative
navion.c_nda = -.0035;
navion.c_ydr = .157;
navion.c_ldr = .107;
navion.c_ndr = -.072;
navion.c_lda_right = -.067;
navion.q = (navion.rho * v.^2)/2; % air dynamic pressure
% navion lateral derivatives %
navion.y_b = (navion.q * navion.s * navion.c_yb)/ navion.w_slugs;
navion.y_p = (navion.q * navion.s * navion.b * navion.c_yp)/ (2 * navion.w_slugs * v);
navion.y_r = (navion.q * navion.s * navion.b * navion.c_yr)/ (2 * navion.w_slugs * v);
navion.y_da = (navion.q * navion.s * navion.c_yda)/ navion.w_slugs;
navion.n_da = (navion.q * navion.s * navion.b * navion.c_nda)/ navion.I_z;
navion.l_da = (navion.q * navion.s * navion.b * navion.c_lda) / navion.I_x; % (1/s^2) control effectiveness
navion.n_b = (navion.q * navion.s * navion.b * navion.c_nb)/ navion.I_z;
navion.n_p = (navion.q * navion.s * (navion.b^2) * navion.c_np)/ (2 * navion.I_x * v);
navion.n_r = (navion.q * navion.s * (navion.b^2) * navion.c_nr)/ (2 * navion.I_x * v);
navion.y_dr = (navion.q * navion.s * navion.c_ydr)/ navion.w_slugs;
navion.n_dr = (navion.q * navion.s * navion.b * navion.c_ndr)/ navion.I_z;
navion.l_dr = (navion.q * navion.s * navion.b * navion.c_ldr)/ navion.I_x;
navion.l_b = (navion.q * navion.s * navion.b * navion.c_lb)/ navion.I_x;
navion.l_p = ((navion.q * navion.s * (navion.b^2) * navion.c_lp) / (2 * navion.I_x * v )); % (1/s) roll damping 
navion.l_r = ((navion.q * navion.s * (navion.b^2) * navion.c_lr) / (2 * navion.I_x * v )); % (1/s) roll damping 

navion.l_da_right = (navion.q * navion.s * navion.b * navion.c_lda_right) / navion.I_x; % (1/s^2) control effectiveness
navion.l_p_wingtips = ((navion.s * (navion.b^2) * navion.c_lp) / (2 * navion.I_x_wingtips ))*((navion.rho * v)/2); % (1/s) roll damping 
navion.l_da_wingtips = (navion.q * navion.s * navion.b * navion.c_lda) / navion.I_x_wingtips; % (1/s^2) control effectiveness
% navion longitudinal derivatives %
navion.x_u = -((navion.c_du + 2*navion.c_d0) * navion.q * navion.s)/(navion.w_slugs * v); 
navion.x_w = -((navion.c_da - navion.c_l0) * navion.q * navion.s)/(navion.w_slugs * v); 
navion.x_a = v * navion.x_w;  
navion.z_u = -((navion.c_lu + 2*navion.c_l0) * navion.q * navion.s)/(navion.w_slugs * v); 
navion.z_w = -((navion.c_la + 2*navion.c_d0) * navion.q * navion.s)/(navion.w_slugs * v); 
navion.z_a = v * navion.z_w; 
navion.z_de = (-navion.c_lde * navion.q * navion.s) / navion.w_slugs;
navion.x_de = 0; 
navion.m_a = (navion.c_ma * navion.q * navion.s * navion.c_bar) / navion.I_y ; 
navion.m_q = (navion.c_mq * (navion.c_bar^2) * navion.q * navion.s) / (2 * v * navion.I_y);
navion.m_u = (navion.c_mu * navion.q * navion.s * navion.c_bar) / (v * navion.I_y) ; 
navion.m_de = (navion.c_mde * navion.q * navion.s * navion.c_bar) / navion.I_x;
% F-104A %
f104.g = 32.174; % (ft/s^2) gravity 
f104.rho = .0023769; % (slugs/ft^3) air density at sea level and 60 deg F
f104.da = deg2rad(25); % maximum aileron deflection
f104.a = 0; % (rad) assuming a wind angle of 0 rad 
f104.gamma = 0; % (rad) assuming a wind angle relative to earth of 0 rad 
f104.theta = f104.a + f104.gamma; % (rad) 
f104.s = 196.1; % (ft^2) wing surface area 
f104.b = 21.94; % (ft) wing span
f104.c_bar = 9.55; % (ft) mean coord
f104.w_lbs = 16300; % (lbs) weight
f104.w_slugs = f104.w_lbs / 32.174; % (slugs) weight
f104.I_x = 3549; % (slugs/ft^2) mass moment of inertia x
f104.I_y = 58611; % (slugs/ft^2) mass moment of inertia y
f104.I_z = 59669; % (slugs/ft^2) mass moment of inertia z
f104.I_x_wingtips =18779; %I_x_f +(.125 *w_f_slugs)*((b_f/2)^2); % (slugs/ft^2) mass moment of inertia x when fuel is in the wingtips
f104.m_long = .257;
f104.c_l = .735;
f104.c_l0 = 0;
f104.c_lu = 0;
f104.c_d = .263;
f104.c_d0 = 0;
f104.c_du = 0;
f104.c_la = 3.44;
f104.c_da = .45;
f104.c_ma = -.64;
f104.c_mu = 0; 
f104.c_la_dot = 0;
f104.c_ma_dot = -1.6;
f104.c_lq = 0;
f104.c_mq = -5.8;
f104.c_lm = 0;
f104.c_dm = 0;
f104.c_mm = 0;
f104.c_lde = .68;
f104.c_mde = -1.46;
f104.m_lat = .257;
f104.c_yb = -1.17;
f104.c_yp = 0;  
f104.c_yr = 0;  
f104.c_yda = 0;  
f104.c_lb = -.175;
f104.c_nb = .5;
f104.c_lp = -.285; % roll damping stability derivative 
f104.c_np = -.14;
f104.c_lr = .265;
f104.c_nr = -.75;
f104.c_lda = .039; % aileron effectiveness control derivative
f104.c_nda = .0042;
f104.c_ydr = .208;
f104.c_ldr = .045;
f104.c_ndr = -.16;
f104.c_lda_right = .0195; % aileron effectiveness control derivative
f104.q = (f104.rho * v.^2)/2; % air dynamic pressure
% f104 lateral derivatives %
f104.y_b = (f104.q * f104.s * f104.c_yb)/ f104.w_slugs;
f104.y_p = (f104.q * f104.s * f104.b * f104.c_yp)/ (2 * f104.w_slugs * v);
f104.y_r = (f104.q * f104.s * f104.b * f104.c_yr)/ (2 * f104.w_slugs * v);
f104.y_da = (f104.q * f104.s * f104.c_yda)/ f104.w_slugs;
f104.n_da = (f104.q * f104.s * f104.b * f104.c_nda)/ f104.I_z;
f104.l_da = (f104.q * f104.s * f104.b * f104.c_lda) / f104.I_x; % (1/s^2) control effectiveness
f104.n_b = (f104.q * f104.s * f104.b * f104.c_nb)/ f104.I_z;
f104.n_p = (f104.q * f104.s * (f104.b^2) * f104.c_np)/ (2 * f104.I_x * v);
f104.n_r = (f104.q * f104.s * (f104.b^2) * f104.c_nr)/ (2 * f104.I_x * v);
f104.y_dr = (f104.q * f104.s * f104.c_ydr)/ f104.w_slugs;
f104.n_dr = (f104.q * f104.s * f104.b * f104.c_ndr)/ f104.I_z;
f104.l_dr = (f104.q * f104.s * f104.b * f104.c_ldr)/ f104.I_x;
f104.l_b = (f104.q * f104.s * f104.b * f104.c_lb)/ f104.I_x;
f104.l_p = ((f104.q * f104.s * (f104.b^2) * f104.c_lp) / (2 * f104.I_x * v )); % (1/s) roll damping 
f104.l_r = ((f104.q * f104.s * (f104.b^2) * f104.c_lr) / (2 * f104.I_x * v )); % (1/s) roll damping 

f104.l_da_right = (f104.q * f104.s * f104.b * f104.c_lda_right) / f104.I_x; % (1/s^2) control effectiveness
f104.l_p_wingtips = ((f104.s * (f104.b^2) * f104.c_lp) / (2 * f104.I_x_wingtips ))*((f104.rho * v)/2); % (1/s) roll damping 
f104.l_da_wingtips = (f104.q * f104.s * f104.b * f104.c_lda) / f104.I_x_wingtips; % (1/s^2) control effectiveness
% navion longitudinal derivatives %
f104.x_u = -((f104.c_du + 2*f104.c_d0) * f104.q * f104.s)/(f104.w_slugs * v); 
f104.x_w = -((f104.c_da - f104.c_l0) * f104.q * f104.s)/(f104.w_slugs * v); 
f104.x_a = v * f104.x_w; 
f104.z_u = -((f104.c_lu + 2*f104.c_l0) * f104.q * f104.s)/(f104.w_slugs * v);
f104.z_w = -((f104.c_la + 2*f104.c_d0) * f104.q * f104.s)/(f104.w_slugs * v); 
f104.z_a = v * f104.z_w; 
f104.z_de = (-f104.c_lde * f104.q * f104.s) / f104.w_slugs; 
f104.x_de = 0; 
f104.m_a = (f104.c_ma * f104.q * f104.s * f104.c_bar) / f104.I_y ; 
f104.m_q = (f104.c_mq * (f104.c_bar^2) * f104.q * f104.s) / (2 * v * f104.I_y);
f104.m_u = (f104.c_mu * f104.q * f104.s * f104.c_bar) / (v * f104.I_y) ; 
f104.m_de = (f104.c_mde * f104.q * f104.s * f104.c_bar) /f104.I_x;
end
