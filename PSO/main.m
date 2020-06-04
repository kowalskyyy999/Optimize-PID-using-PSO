clc
clear all
close all

problems.CostFunction = @(x) CostFunction(x);
problems.nVar = 3;
problems.VarMin = 0;
problems.VarMax = 20;           % VarMax and  UB must be same values
problems.UB = [20 20 20];
problems.LB = [0.01 0.01 0.01];

params.nPop = 50;
params.w = 1;
params.wdamp = 1;
params.c1 = 2;
params.c2 = 2;

isLooping = true;
gen = 0;

[GlobalBest, particle] = initialize(problems, params);

while isLooping
    gen = gen + 1;
    GlobalBest = PSO(particle, GlobalBest, problems, params);

    disp(['Iterasi ' num2str(gen) ' => Best Cost = ' num2str(GlobalBest.Cost)]);
    
    isLooping = termination(GlobalBest);
end

[PID,kp,ki,kd] = results(GlobalBest);
