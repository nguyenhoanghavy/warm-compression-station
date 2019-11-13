function [ Cp ] = alcalc( T )

    P1 = [-0.000035895089215   0.004512957539583  -0.097952837135204   0.993719377386340  -2.582595215165587];
    P2 = 1.0e+02 *[  0.000000512579258  -0.000416702486818   0.121355801039690  -3.716163465660395];

    for i = 1:length(T)
        if T(i)<55.7
            Cp(i) = polyval(P1,T(i)); 
        else
            Cp(i) = polyval(P2,T(i)); 
        end
    end

end
    




