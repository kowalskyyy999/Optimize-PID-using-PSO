function [GlobalBest, particle] = initialize(problems, params)
    nVar = problems.nVar;
    VarMin = problems.VarMin;
    VarMax = problems.VarMax;
    nPop = params.nPop;
    VarSize = [1 nVar];
    
    empty_particle.Position = [];
    empty_particle.Velocity = [];
    empty_particle.Cost = [];
    empty_particle.Best.Position = [];
    empty_particle.Best.Cost = [];

    particle = repmat(empty_particle, nPop, 1);
    GlobalBest.Cost = inf;

    for i=1:nPop
        particle(i).Position = unifrnd(VarMin, VarMax, VarSize);
        particle(i).Velocity = zeros(VarSize);
        particle(i).Cost = CostFunction(particle(i).Position);
        particle(i).Best.Position = particle(i).Position;
        particle(i).Best.Cost = particle(i).Cost;

        if particle(i).Best.Cost < GlobalBest.Cost
            GlobalBest = particle(i).Best;
        end
    end

end