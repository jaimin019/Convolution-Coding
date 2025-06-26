% This function generates a state table for a convolutional encoder.

function stateTable = generateStateTable(K, generators)

    numStates = 2^(K-1);
    stateTable = zeros(numStates, 4);

    for state = 0:numStates-1
        prevBits = bitget(state, K-1:-1:1);
        for inp = 0:1
            reg = [inp prevBits];
            outVec = mod(generators * reg', 2);
            out = bi2de(outVec', 'left-msb');
            nextBits = reg(1:end-1);
            nextState = bi2de(nextBits, 'left-msb');
            col = inp*2 + 1;
            stateTable(state+1, col)   = out;
            stateTable(state+1, col+1) = nextState;
        end
    end
end
