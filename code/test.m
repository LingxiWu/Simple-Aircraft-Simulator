
% in1 = struct()
% in1.x = 1;
% in1.y = 1;
% in1.xd = 9;
% in1.yd = 9;
% in1.theta = 0;
% 
% in2 = struct()
% in2.x = 2;
% in2.y = 1;
% in2.xd = 8;
% in2.yd = 8;
% in2.theta = 180;

% safetyMonitor(in1, in2)
% runSimulation([0, 0], [2, -1], [2, 0], [-2, -1], 40)
% testSimulation([0, 0], [2, 0], [1, 1], [1, -3], 40)
[numPassed, numFailed, log] = testbench(3, 100);
% numPassed;
% numFailed;
disp(log);









