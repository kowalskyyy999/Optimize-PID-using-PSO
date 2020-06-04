function [PID,kp,ki,kd] = results(GlobalBest)
    num = [3.019];
    den = [1 23 73.75 22.32];
    sys = tf(num,den);
    x = GlobalBest.Position;
    kp = x(1);
    ki = x(2);
    kd = x(3);

    num_PID = [kd kp ki];
    den_PID = [1 0];
    PID = tf(num_PID, den_PID);
    PID = feedback(PID*sys, 1)
    stepplot(PID,50);
    stepinfo(PID)
end