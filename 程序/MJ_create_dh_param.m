function [ dh_list ] = MJ_create_dh_param(  )
theta_offset = [0, -pi/2, 0, 0, 0, 0];
d = [0,     0,     0,	0.2745,	0,	0.150];
%a = [0,	0.02315,  0.26,       0.0276,	0,      0];
a = [0,	0,  0.26,       0.0276,	0,      0];
alpha = [0, -pi/2,  0, -pi/2, pi/2, -pi/2];

dh_list = [theta_offset; d; a; alpha]'; %转置，然后每一行对应相应的关节的D-H参数
if numrows(dh_list) ~= 6 || numcols(dh_list) ~= 4
    error('bad dh_param_list')
end
end

