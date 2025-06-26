% This function performs convolutional encoding on a binary message using the specified generator polynomials.

function codeword = convolutionalEncoding(msg, generators)
    [numRows,numCols] = size(generators);
    mid_codeword = zeros(numRows,numCols+length(msg)-1);
    for row = 1 : numRows
        g = generators(row,:);
        mid_codeword(row,:) = mod(conv(msg,g),2);
    end
    codeword = mid_codeword(:).';
end
