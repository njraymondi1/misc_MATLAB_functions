function [ynoisy] = awgn_simulation(N, M, x)
% Author - Nate Raymondi

% This function provides an AWGN noisy, baseband modulated 
% SRRC pulse-shaped signal

% symbols -> upsample -> tx pulse shape -> awgn 
% this will be for psk or qam modulation
    %N is the number of symbols
    %M is the modulation order 
    %x determines if we use PSK(x=0) or QAM(x=1)
%--------------------------------------------------------------------------   

%Generate random sequence
symbols = randi([0 M-1], 1, N);

%Apply Modulation
if x == 1
    modsig = qammod(symbols, M);
elseif x == 0
    modsig = pskmod(symbols, M);
end

%Create SRRC Filter - rcosdesign(rolloff, span, sps, 'sqrt')
   %rolloff is the filter rolloff factor
   %span is how many symbols the filter truncates to
   %sps is the # of samples in each symbol
h = rcosdesign(0.35, 4, 8, 'sqrt');

%filter the signal
y = upfirdn(modsig, h, 8);

%AWGN channel - awgn(y,snr)
   %snr is to be given in dB
ynoisy = awgn(y,100);

end


