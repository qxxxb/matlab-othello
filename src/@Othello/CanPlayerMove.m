function [result, auxiliary] = CanPlayerMove(obj)
% [result, auxiliary] = CanPlayerMove(obj)
%
% Determine whether the player has available moves
%
% =======
% Returns
% =======
%     `result`: Whether the player has available moves
%
%     `auxiliary`
%         - Struct with the following values:
%             `coordinate`:
%                 - The coordinate of the first legal move found
%                 - This value should only be used when `result` is true
%
%             `flankEndpoints`:
%                 - Flank endpoints of the first legal move found
%                 - This comes from `IsLegalCoordinate`
%                 - This value should only be used when `result` is true
%
%         - Can be used as an optimization if the player happens to select the
%           same coordinate that was determined to be legal

% Start checking every cell on the board until we find a move that is legal

result = false;
auxiliary = struct;

s = obj.Board.GetBoardSize();
for i = 1:s(1)
    for j = 1:s(2)
        coordinate = [i, j];
        [isLegalMove, auxiliary] = obj.IsLegalMoveCoordinate(coordinate);
        if (isLegalMove)
            result = true;
            auxiliary.coordinate = coordinate;
            return;
        end
    end
end
