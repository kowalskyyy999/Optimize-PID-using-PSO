function GlobalBest = PSO(particle, GlobalBest, problems, params)    
    
    CostFunction = problems.CostFunction;
    nVar = problems.nVar;
    UB = problems.UB;
    LB = problems.LB;
    
    w = params.w;
    wdamp = params.wdamp;
    c1 = params.c1;
    c2 = params.c2;
    nPop = params.nPop;
    
    for i=1:nPop
        particle(i).Velocity = w*particle(i).Velocity +...
            c1*rand()*(particle(i).Best.Position - particle(i).Position) +...
            c2*rand()*(GlobalBest.Position - particle(i).Position);

        particle(i).Position = particle(i).Position + particle(i).Velocity;

        for j=1:nVar
            if particle(i).Position(j) < LB(j)
                particle(i).Position(j) = LB(j);
            elseif particle(i).Position(j) > UB(j)
                particle(i).Position(j) = UB(j);
            end
        end

        particle(i).Cost = CostFunction(particle(i).Position);

        if particle(i).Cost < particle(i).Best.Cost
            particle(i).Best.Position = particle(i).Position;
            particle(i).Best.Cost = particle(i).Cost;

            if particle(i).Best.Cost < GlobalBest.Cost
                GlobalBest = particle(i).Best;
            end
        end
        w = w*wdamp;
    end
    
end