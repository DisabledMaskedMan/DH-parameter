clc
clear all
SAMPLE_TIME = 0.004;
%% 工具笛卡尔示教模型(关节空间规划)的相关参数
[ dh_list ] = MJ_create_dh_param(  );       %DH参数生成
length_f2t=0.138;                            %特别注意:法兰中心点f点到工具中心t点距离,单位m
dh_theta_offset = dh_list(:,1);
dh_d = dh_list(:,2)+[0 0 0 0 0 length_f2t]';%工具坐标系只有z向偏移0.0m
dh_a = dh_list(:,3);
dh_alpha = dh_list(:,4);
%initial_q = [0, 0, 0, 0, pi/2, 0];          %特别注意：该模型要求机械臂的初始状态为：关节角度[0 0 0 0 90° 0]
initial_q = [0, 0, 0, 0, pi/2, 0];          %特别注意：该模型要求机械臂的初始状态为：关节角度[0 0 0 0 90° 0]
period_update_xyz_des = 10;                 %目标点更新周期
move_joints = 1;                            %模型脚本识别
vel_percent=0.2;
pulse_max = [55.74 29.52 22.22 127.8 56.82 55.56]; %见模型中速度限制
theta_vel_max = [15, 10, 10, 40, 40, 40]*pi/180;   %关节运动最大速度
theta_acc_max = theta_vel_max*2;
theta_min = [-180,	-120,     -100,	-195,	-120,	-360]*pi/180;%% 关节角度限制
theta_max = [180,	80, 	70,     180,	110,	360]*pi/180;
init_position = [274.5 0 543.1-138];


R = 30;
k = 25;
i= 1;
for t = 0:0.1:2*pi
    Px(i) = R * t * cos(t);
    Py(i) = R * t * sin(t);
    Pz(i) = t*k;
    i = i + 1;
end