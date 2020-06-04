function isLooping = termination(GlobalBest)    

    if GlobalBest.Cost < 62.929
        isLooping=false;
    else
        isLooping=true;
    end

end