load('swf_est.mat');
load('msckf_est.mat');
load('dataset3.mat');
kStart = 500;
kEnd = 1000;
swf_trans_err = transErrVec;
swf_rot_err = rotErrVec;

transLim = 0.4;
rotLim = 0.4;
recycleStates = 'Yes';

figure
subplot(3,1,1)
plot(t(kStart:kEnd), msckf_trans_err(1,:), '-b', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), swf_trans_err(1,:), '-g', 'LineWidth', 1.2)
ylim([-transLim transLim])
legend('MSCKF', 'SWF');
title(sprintf('Translational Error (MSCKF vs. SWF)', kappa, recycleStates))
ylabel('\delta r_x')


subplot(3,1,2)
plot(t(kStart:kEnd), msckf_trans_err(2,:), '-b', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), swf_trans_err(2,:), '-g', 'LineWidth', 1.2)
ylim([-transLim transLim])
ylabel('\delta r_y')

subplot(3,1,3)
plot(t(kStart:kEnd), msckf_trans_err(3,:), '-b', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), swf_trans_err(3,:), '-g', 'LineWidth', 1.2)
ylim([-transLim transLim])
ylabel('\delta r_z')
xlabel('t_k')
%set(gca,'FontSize',12)
%set(findall(gcf,'type','text'),'FontSize',12)

figure
subplot(3,1,1)
plot(t(kStart:kEnd), msckf_rot_err(1,:), '-b', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), swf_rot_err(1,:), '-g', 'LineWidth', 1.2)
ylim([-rotLim rotLim])
title(sprintf('Rotational Error (MSCKF vs. SWF)', kappa, recycleStates))
ylabel('\delta\theta_x')
legend('MSCKF', 'SWF');


 
subplot(3,1,2)
plot(t(kStart:kEnd), msckf_rot_err(2,:), '-b', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), swf_rot_err(3,:), '-g', 'LineWidth', 1.2)
ylim([-rotLim rotLim])
ylabel('\delta\theta_y')

subplot(3,1,3)
plot(t(kStart:kEnd), msckf_rot_err(3,:), '-b', 'LineWidth', 1.2)
hold on
plot(t(kStart:kEnd), swf_rot_err(3,:), '-g', 'LineWidth', 1.2)

ylim([-rotLim rotLim])
ylabel('\delta\theta_z')
xlabel('t_k')