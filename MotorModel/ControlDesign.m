load MotorSpecMatFile.mat

s = tf('s');
G1 = Kt/((R+s*L)*(r+s*J)+Ke*Kt);        % Velocity(Omega)/V
G2 = G1/s;                                        % Angle/V

% Settling time for position control: 1s
% Settling time for current control: 0.2s (latest)
% rise time: tr = 1.8/w_n
% 1% settling time 4.6/sigma

% Motor model: Angle position vs motor torque
AngleOverTorque = 1/(J*s^2 + s*r);
VelAngleOverTorque = AngleOverTorque*s;

TorqueOverVoltage = G1/VelAngleOverTorque;

%% Controller

% Current controller: PI controller
% KP: 1.63 --> lowest rise time, less overshoot
CI = kp_I + 1/(Ti*s);

% CurrentFeedback time delay, from EPOS 4 note
% Pade approximation for time delay, T = 0.06ms
T = 0.06/1000;
I_delay = (1-T/2*s)/(1+T/2*s);

g1cl = CI*G1/(1+CI*G1);
g2cl = CI*G2/(1+CI*G2);

% figure(1);
% nyquist(CI*G1);
% figure(2);

% Kingpin inclnation: 10.1 deg from Fusion 360
% kingpin offset: 26.264 (distance btw tyre and intersection
% line)

