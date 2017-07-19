function [out] = Noncon_CAF(x, alpha, Ts, N)
% Author - Nate Raymondi

% A function to find the Non-conjugate CAF of a cyclostationary signal

% Reference "Energy Efficient Processor for Blink Signal Classification in
%   Cognitive Radio Networks" by Rebeiz et. al

% Inputs
    % x - our input signal
    % alpha - our alpha vector to check over
    % Ts - our sampling period
    % N - the length our input signal to use to perform the calculation
    
% Outputs
    % out - an output vector of length N that has the magnitude of all CCAF
    %   calculations that were performed

% Shorten input signal to length N (if necessary)
if N ~= 0
    x = x(1:N);
else
    N = length(x);    
end

% Input signal magnitude operations
x_four = x.^4;

% Declare 
out = zeros(1,length(alpha));
q = zeros(1,N);

% Create 
for k = 1:length(alpha)
    for j = 1:N
    q(j) = x_four(j).*exp( -1i * 2 * pi * (j-1) * Ts * alpha(k) );
    end
    q = sum(q);
    out(1,k) = abs(q);
end
end






