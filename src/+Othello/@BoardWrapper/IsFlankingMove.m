function [result, auxiliary] = IsFlankingMove(obj, coordinate, playerPiece)
% [result, auxiliary] = IsFlankingMove(obj, coordinate, playerPiece)

auxiliary.flankEndpoints = obj.GetEndpointsOfFlanks(coordinate, playerPiece);

% If there are any flank endpoints, then there are available flanks
result = false;
for i = 1:numel(auxiliary.flankEndpoints)
    if (~isempty(auxiliary.flankEndpoints{i}))
        result = true;
    end
end
