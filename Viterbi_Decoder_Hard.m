function decoded = viterbiDecode_hard(s, n , received)
    numStates = size(s,1);
    N = size(received,1);
    pathMetric = inf(numStates, N+1);
    prevState  = zeros(numStates, N+1);
    prevInput  = zeros(numStates, N+1);    
    pathMetric(1,1) = 0;

    for t = 1:N
        r = received(t,:);
        for st = 1:numStates
            if isfinite(pathMetric(st,t))
                for inp = 0:1 
                    col = inp*2 + 1;
                    outBits = de2bi(s(st,col), n, 'left-msb');
                    ns = s(st, col+1) + 1;
                    hd = sum(xor(outBits, r));
                    metric = pathMetric(st,t) + hd;
                    if metric < pathMetric(ns, t+1)
                        pathMetric(ns, t+1) = metric;
                        prevState(ns, t+1)  = st;
                        prevInput(ns, t+1)  = inp;
                    end
                end
            end
        end
    end
    cur = 1;
    decRev = zeros(1,N);
    for t = N+1:-1:2
        decRev(t-1) = prevInput(cur, t);
        cur = prevState(cur, t);
    end
    decoded = decRev;
end
