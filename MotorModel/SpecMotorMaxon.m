Io = 0.497; % No load current [A]
no = 4300; % No load RPM

L = 0.279/10^3; % H inductance
Kt = 52.5/10^3; % torque constant [mNm/A *10^-3 = Nm/A]

% Mass inertia = rotor + load [g.cm^2 * 10^-7 = kg.m^2]
J = (810 + 17.2 + 5000/53^2) * 10^-7;

R = 0.293; % Resistance [Ohm]
r  = Km*Io/(no*2*pi/60); % viscous friction = km * Io/ (no*2*pi/60) [Nm/rad/s]
Ke = 52.5/1000;
GR = 53;

radps2RPM = 60/(2*pi);

%% controller
maxI = 10/sqrt(2);
maxV = 24;
%% for position

kp =65; ki = 0.001; D = 0.05*kp;
kp =1.6; ki = 1.389; D = 93.645/1000;
kd = 10*kp;
N = kd/D;
RPM = 0;

%% for current control
kp_I = 2;
ki_I = 2/(L/R); Ti = kp_I/ki_I; Tt = Ti;
ke_I = 1/(Tt); % anti windup gain, rule of thumb, Tt >= Ti

% smaller Tt, faster reset


% Io = 497; % No load current [A]
% no = 4300; % No load RPM
% 
% L = 0.279; % mH inductance
% Km = 52.5; % torque constant [mNm/A]
% J = 810; % Mass inertia = rotor + load [g.cm^2]
% R = 0.293; % Resistance [Ohm]
% r  = Km*Io/(no*2*pi/60)*1000; % viscous friction = km * Io/ (no*2*pi/60) [uNm/rad/s]