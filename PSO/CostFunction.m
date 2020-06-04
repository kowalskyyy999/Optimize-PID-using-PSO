function fitness = CostFunction(x)
    SP = 1;
    num = [3.019];
    den = [1 23 73.75 22.32];
    
    sys = tf(num, den);
    
    kp = x(1);
    ki = x(2);
    kd = x(3);
    
    num_PID = [kd kp ki];
    den_PID = [1 0];
    
    PID = tf(num_PID, den_PID);
    
    sys_PID = feedback(PID*sys, 1);
    [y, t] = step(sys_PID);
    results = stepinfo(y, t, SP);
    ess = abs(SP - y(end));
    RiseTime = results.RiseTime;
    Overshoot = results.Overshoot;
    SettlingTime = results.SettlingTime;
    
    fitness1 = 1/(RiseTime+1)*100;
    fitness2 = 1/(ess+1)*100;
    if ess == 0
        fitness3 = 1*100;
    else
        fitness3 = 1/(Overshoot+1)*100;
    end
    
    if SettlingTime <= 7
        fitness4 = 1*100;
    else
        fitness4 = (1/SettlingTime)*100;
    end
    
    fitness = 400 - (fitness1 + fitness2 + fitness3 + fitness4);

end