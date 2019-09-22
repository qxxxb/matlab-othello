function MakeFlankSteps(obj)
% MakeFlankSteps(obj)

% Calculate translational vectors (steps) for potential flanking paths {{{
%     - `i` is the translation along the x-axis (across columns)
%     - `j` is the translation along the y-axis (across rows)
%
%     - We know that it will produce only 8 vectors:
%       1 2 3
%       4 ~ 5
%       6 7 8

% Pre-allocate size for efficiency
obj.FlankSteps = cell(1, 8);
index = 1;
for i = -1:1
    for j = -1:1
        % The translation vector `[0, 0]` can't be used because then you
        % wouldn't move anywhere
        if (i ~= 0 || j ~= 0)
            obj.FlankSteps{index} = [i, j];
            index = index + 1;
        end
    end
end

% }}}
