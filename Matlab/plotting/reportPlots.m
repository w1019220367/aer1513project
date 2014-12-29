%% 500-1000

swf10 = load('swf_500_1000_10.mat');
swf50 = load('swf_500_1000_50.mat');
swf100 = load('swf_500_1000_100.mat');
msckf5 = load('msckf_500_1000_min5_maxInf');
msckf10 = load('msckf_500_1000_min10_max50');
msckf20 = load('msckf_500_1000_min20_max100');
imu = load('imu_500_1000.mat');

load('../datasets/dataset3.mat');
kStart = 500;
kEnd = 1000;


transLim = 0.5;
rotLim = 0.5;
fontSize = 14;

figure
subplot(3,1,1)
plot(t(kStart:kEnd), imu.msckf_trans_err(1,:), '-k', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), msckf5.msckf_trans_err(1,:), '-b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf10.msckf_trans_err(1,:), '-.b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf20.msckf_trans_err(1,:), '--b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf10.swf_trans_err(1,:), '-g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf50.swf_trans_err(1,:), '-.g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf100.swf_trans_err(1,:), '--g', 'LineWidth', 1.2)

xlim([t(kStart) t(kEnd) ]);
ylim([-transLim transLim])
h_legend = legend('IMU Only','MSCKF 5-Inf', 'MSCKF 10-50', 'MSCKF 20-100', 'SWF 10', 'SWF 50', 'SWF 100','Location', 'southeast');
set(h_legend,'FontSize',8);

title(sprintf('Translational Error (Interval 1)'))
ylabel('\delta r_x [m]')
set(gca,'FontSize',fontSize)
grid on
grid minor

subplot(3,1,2)
plot(t(kStart:kEnd), imu.msckf_trans_err(2,:), '-k', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), msckf5.msckf_trans_err(2,:), '-b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf10.msckf_trans_err(2,:), '-.b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf20.msckf_trans_err(2,:), '--b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf10.swf_trans_err(2,:), '-g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf50.swf_trans_err(2,:), '-.g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf100.swf_trans_err(2,:), '--g', 'LineWidth', 1.2)

xlim([t(kStart) t(kEnd) ]);
ylim([-transLim transLim])
ylabel('\delta r_y [m]')
set(gca,'FontSize',fontSize)
grid on
grid minor


subplot(3,1,3)
plot(t(kStart:kEnd), imu.msckf_trans_err(3,:), '-k', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), msckf5.msckf_trans_err(3,:), '-b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf10.msckf_trans_err(3,:), '-.b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf20.msckf_trans_err(3,:), '--b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf10.swf_trans_err(3,:), '-g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf50.swf_trans_err(3,:), '-.g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf100.swf_trans_err(3,:), '--g', 'LineWidth', 1.2)

xlim([t(kStart) t(kEnd) ]);
ylim([-transLim transLim])
xlabel('t_k [s]')
set(gca,'FontSize',fontSize)
set(findall(gcf,'type','text'),'FontSize',fontSize)
grid on
grid minor

filename = sprintf('6-Way-Comparison-500-100-Trans.pdf');
export_fig(gcf, filename, '-transparent');

figure
subplot(3,1,1)
plot(t(kStart:kEnd), imu.msckf_rot_err(1,:), '-k', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), msckf5.msckf_rot_err(1,:), '-b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf10.msckf_rot_err(1,:), '-.b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf20.msckf_rot_err(1,:), '--b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf10.swf_rot_err(1,:), '-g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf50.swf_rot_err(1,:), '-.g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf100.swf_rot_err(1,:), '--g', 'LineWidth', 1.2)
xlim([t(kStart) t(kEnd) ]);
ylim([-rotLim rotLim])
title(sprintf('Rotational Error (Interval 1)'))
ylabel('\delta\theta_x')
h_legend = legend('IMU Only','MSCKF 5-Inf', 'MSCKF 10-50', 'MSCKF 20-100', 'SWF 10', 'SWF 50', 'SWF 100','Location', 'southeast');
set(h_legend,'FontSize',8);
set(gca,'FontSize',fontSize)
grid on
grid minor


 
subplot(3,1,2)
plot(t(kStart:kEnd), imu.msckf_rot_err(2,:), '-k', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), msckf5.msckf_rot_err(2,:), '-b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf10.msckf_rot_err(2,:), '-.b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf20.msckf_rot_err(2,:), '--b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf10.swf_rot_err(2,:), '-g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf50.swf_rot_err(2,:), '-.g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf100.swf_rot_err(2,:), '--g', 'LineWidth', 1.2)
xlim([t(kStart) t(kEnd) ]);
ylim([-rotLim rotLim])
ylabel('\delta\theta_y')
set(gca,'FontSize',fontSize)
grid on
grid minor

subplot(3,1,3)
plot(t(kStart:kEnd), imu.msckf_rot_err(3,:), '-k', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), msckf5.msckf_rot_err(3,:), '-b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf10.msckf_rot_err(3,:), '-.b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf20.msckf_rot_err(3,:), '--b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf10.swf_rot_err(3,:), '-g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf50.swf_rot_err(3,:), '-.g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf100.swf_rot_err(3,:), '--g', 'LineWidth', 1.2)
xlim([t(kStart) t(kEnd) ]);
ylim([-rotLim rotLim])
ylabel('\delta\theta_z')
xlabel('t_k [s]')
grid on
grid minor

set(gca,'FontSize',fontSize)
set(findall(gcf,'type','text'),'FontSize',fontSize)

filename = sprintf('6-Way-Comparison-500-100-Rot.pdf');
export_fig(gcf, filename, '-transparent');

%% 1215-1715

swf10 = load('swf_1215_1715_10.mat');
swf50 = load('swf_1215_1715_50.mat');
swf100 = load('swf_1215_1715_100.mat');
msckf5 = load('msckf_1215_1715_min5_maxInf');
msckf10 = load('msckf_1215_1715_min10_max50');
msckf20 = load('msckf_1215_1715_min20_max100');
imu = load('imu_1215_1715.mat');

load('../datasets/dataset3.mat');
kStart = 500;
kEnd = 1000;


transLim = 1;
rotLim = 0.5;
fontSize = 14;

figure
subplot(3,1,1)
plot(t(kStart:kEnd), imu.msckf_trans_err(1,:), '-k', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), msckf5.msckf_trans_err(1,:), '-b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf10.msckf_trans_err(1,:), '-.b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf20.msckf_trans_err(1,:), '--b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf10.swf_trans_err(1,:), '-g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf50.swf_trans_err(1,:), '-.g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf100.swf_trans_err(1,:), '--g', 'LineWidth', 1.2)

xlim([t(kStart) t(kEnd) ]);
ylim([-transLim transLim])
h_legend = legend('IMU Only','MSCKF 5-Inf', 'MSCKF 10-50', 'MSCKF 20-100', 'SWF 10', 'SWF 50', 'SWF 100','Location', 'northeast');
set(h_legend,'FontSize',8);

title(sprintf('Translational Error (Interval 2)'))
ylabel('\delta r_x [m]')
set(gca,'FontSize',fontSize)
grid on
grid minor

subplot(3,1,2)
plot(t(kStart:kEnd), imu.msckf_trans_err(2,:), '-k', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), msckf5.msckf_trans_err(2,:), '-b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf10.msckf_trans_err(2,:), '-.b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf20.msckf_trans_err(2,:), '--b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf10.swf_trans_err(2,:), '-g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf50.swf_trans_err(2,:), '-.g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf100.swf_trans_err(2,:), '--g', 'LineWidth', 1.2)

xlim([t(kStart) t(kEnd) ]);
ylim([-transLim transLim])
ylabel('\delta r_y [m]')
set(gca,'FontSize',fontSize)
grid on
grid minor


subplot(3,1,3)
plot(t(kStart:kEnd), imu.msckf_trans_err(3,:), '-k', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), msckf5.msckf_trans_err(3,:), '-b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf10.msckf_trans_err(3,:), '-.b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf20.msckf_trans_err(3,:), '--b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf10.swf_trans_err(3,:), '-g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf50.swf_trans_err(3,:), '-.g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf100.swf_trans_err(3,:), '--g', 'LineWidth', 1.2)

xlim([t(kStart) t(kEnd) ]);
ylim([-transLim transLim])
xlabel('t_k [s]')
set(gca,'FontSize',fontSize)
set(findall(gcf,'type','text'),'FontSize',fontSize)
grid on
grid minor

filename = sprintf('6-Way-Comparison-1215-1715-Trans.pdf');
export_fig(gcf, filename, '-transparent');

figure
subplot(3,1,1)
plot(t(kStart:kEnd), imu.msckf_rot_err(1,:), '-k', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), msckf5.msckf_rot_err(1,:), '-b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf10.msckf_rot_err(1,:), '-.b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf20.msckf_rot_err(1,:), '--b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf10.swf_rot_err(1,:), '-g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf50.swf_rot_err(1,:), '-.g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf100.swf_rot_err(1,:), '--g', 'LineWidth', 1.2)
xlim([t(kStart) t(kEnd) ]);
ylim([-rotLim rotLim])
title(sprintf('Rotational Error (Interval 2)'))
ylabel('\delta\theta_x')
h_legend = legend('IMU Only','MSCKF 5-Inf', 'MSCKF 10-50', 'MSCKF 20-100', 'SWF 10', 'SWF 50', 'SWF 100','Location', 'northeast');
set(h_legend,'FontSize',8);
set(gca,'FontSize',fontSize)
grid on
grid minor


 
subplot(3,1,2)
plot(t(kStart:kEnd), imu.msckf_rot_err(2,:), '-k', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), msckf5.msckf_rot_err(2,:), '-b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf10.msckf_rot_err(2,:), '-.b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf20.msckf_rot_err(2,:), '--b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf10.swf_rot_err(2,:), '-g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf50.swf_rot_err(2,:), '-.g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf100.swf_rot_err(2,:), '--g', 'LineWidth', 1.2)
xlim([t(kStart) t(kEnd) ]);
ylim([-rotLim rotLim])
ylabel('\delta\theta_y')
set(gca,'FontSize',fontSize)
grid on
grid minor

subplot(3,1,3)
plot(t(kStart:kEnd), imu.msckf_rot_err(3,:), '-k', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), msckf5.msckf_rot_err(3,:), '-b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf10.msckf_rot_err(3,:), '-.b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), msckf20.msckf_rot_err(3,:), '--b', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf10.swf_rot_err(3,:), '-g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf50.swf_rot_err(3,:), '-.g', 'LineWidth', 1.2)
plot(t(kStart:kEnd), swf100.swf_rot_err(3,:), '--g', 'LineWidth', 1.2)
xlim([t(kStart) t(kEnd) ]);
ylim([-rotLim rotLim])
ylabel('\delta\theta_z')
xlabel('t_k [s]')
grid on
grid minor

set(gca,'FontSize',fontSize)
set(findall(gcf,'type','text'),'FontSize',fontSize)

filename = sprintf('6-Way-Comparison-1215-1715-Rot.pdf');
export_fig(gcf, filename, '-transparent');