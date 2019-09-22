function flankEndpoints = GetEndpointsOfFlanks(obj, coordinate, playerPiece)
% flankEndpoints = GetEndpointsOfFlanks(obj, coordinate, playerPiece)

import Othello.BoardWrapper;

% In order to determine whether or not the move specified by `coordinate` is a
% flanking move, we walk along paths for potential flanks until we can determine
% whether they are flanks or not

% First note that `obj.FlankSteps` contains pre-calculated translational vectors
% (steps) for the possible flanking paths

% Record the endpoint of each flanking path. If it's not flanking, it has no
% endpoint, so the value will be `[]`
flankEndpoints = cell(1, numel(obj.FlankSteps));

for i = 1:numel(obj.FlankSteps)
    step = obj.FlankSteps{i};
    stepCoordinate = coordinate;

    % First step: must be an enemy piece {{{

    stepCoordinate = stepCoordinate + step;

    if (~obj.IsOnBoard(stepCoordinate))
        flankEndpoints{i} = [];
        continue;
    end

    space = obj.GetSpace(stepCoordinate);
    if (space == BoardWrapper.EMPTY_PIECE || space == playerPiece)
        flankEndpoints{i} = [];
        continue;
    end

    % }}}

    % Continue stepping {{{
    %     - If an enemy piece is met, continue stepping
    %     - If an empty space is met, then `coordinate` is not a flanking move
    %     - If another piece belonging to the playing is met, then `coordinate`
    %       is a flanking move

    while (true)
        stepCoordinate = stepCoordinate + step;

        if (~obj.IsOnBoard(stepCoordinate))
            break;
        end

        space = obj.GetSpace(stepCoordinate);

        if (space == BoardWrapper.EMPTY_PIECE)
            flankEndpoints{i} = [];
            break;
        elseif (space == playerPiece)
            % We have found a flank, and we store it
            flankEndpoints{i} = stepCoordinate;
            break;
        end
    end

    % }}}
end
