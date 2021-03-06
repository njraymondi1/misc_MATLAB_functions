function [I,J] = maxfilter(a,M)
% Author - Nate Raymondi

% This function will find the M largest values in a matrix and will 
%    plot them on an x-y axis corresponding to their position in the matrix

% This function is useful for visualizing maxima of a 3-dimensional curve.
%    The M maxima will be passed and plotted as a view of the x-y axis from
%    above

% Inputs
    %a - any matrix
    %M - the number of maxima desired out of the matrix

% Outputs
    %I,J - the matrix subscript locations of the maxima. These can be
       % visualized by plotting with the commented out code at the bottom of
       %this function


% Begin Loop to identify maxima 
j = 1;

indices = zeros(1,length(a(:)));
while j < M+1
    % Identify the max value and index location of matrix a
    [m,i] = max(a(:));
    % Save the index location
    indices(j) = i;
    % Replace max value with 0 to move forward
    a(i) = 0;
    j = j + 1;
end

% Arrange captured indeices lowest to highest
indices = sort(indices);

% Get rid of all zero elements
indices(indices==0) = [];

% Find the matrix location (subscript) for each index
[I,J] = ind2sub(size(a),indices);

%{
% Plot the maxima
figure()
axis ij
hold on
axis([1 size(a,2) 1 size(a,1)])
hold on
scatter(J,I,'filled')
%}

end


