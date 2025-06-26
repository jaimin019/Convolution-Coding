% This script compares the performance of Viterbi decoder with hard decision

SNR = 0 : 0.5 : 10;
length_SNR = length(SNR);

generators = {
    struct('K', 3, 'poly', [1 0 1; 1 1 1]), ...
    struct('K', 4, 'poly', [1 1 0 1; 1 1 1 1; 1 0 0 1]), ...
    struct('K', 6, 'poly', [1 0 1 1 1 1; 1 1 1 0 0 1; 1 1 0 1 0 1])
    };

ber_hard = zeros(length(generators), length_SNR);

trails = 10000;
message_size = 10;

for g = 1:length(generators)
    gen = generators{g};
    K = gen.K;
    G = gen.poly;
    n = size(G, 1);

    stateTable = generateStateTable(K, G);

    for idx = 1:length_SNR
        i = SNR(idx);
        noiseVariance = 10 ^ (- i / 10);
        curr_success_hard = 0;

        for t = 1 : trails
            messageBits = randi([0 1], 1, message_size);
            encodedBits = convolutionalEncoding(messageBits, G);
            modulatedSignal = 1 - 2 * encodedBits;

            noiseSamples = sqrt(noiseVariance) * randn(size(modulatedSignal));
            receivedSignal = modulatedSignal + noiseSamples;

            demodulatedBits = double(receivedSignal < 0);
            numSymbols = length(demodulatedBits)/n;
            demodulatedSymbol = reshape(demodulatedBits, n, numSymbols)';

            decoded_hard = viterbiDecode_hard(stateTable, n, demodulatedSymbol);
            if isequal(messageBits, decoded_hard(1:length(messageBits)))
                curr_success_hard = curr_success_hard + 1;
            end
        end
        ber_hard(g, idx) = 1 - (curr_success_hard / trails);
    end
end

figure;
semilogy(SNR, ber_hard(1,:), 'r', 'LineWidth', 2); hold on;
semilogy(SNR, ber_hard(2,:), 'g', 'LineWidth', 2);
semilogy(SNR, ber_hard(3,:), 'b', 'LineWidth', 2);

xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('Viterbi Decoder Performance (Hard Decision)');
legend('K=3 r =1/2', 'K=4 r = 1/3', 'K=6 r = 1/3', 'Location', 'best');
grid on;