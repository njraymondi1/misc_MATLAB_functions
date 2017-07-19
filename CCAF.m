function [out] = CCAF(x, alpha, Ts, N)
% Author - Nate Raymondi

% A function to find the Conjugate CAF of a cyclostationary signal

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
x_mag = abs(x);
x_mag_sq = x_mag.^2;
  
% Declare 
out = zeros(1,length(alpha));
q = zeros(1,N);

% Create 
for k = 1:length(alpha)
    for j = 1:N
    q(j) = x_mag_sq(j).*exp( -1i * 2 * pi * (j) * Ts * alpha(k) );
    end
    q = sum(q);
    out(1,k) = abs(q);
    %out(1,k) = (1/length(x)) .* out(1,k);
end
end



