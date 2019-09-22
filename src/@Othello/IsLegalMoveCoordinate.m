function [result, auxiliary] = IsLegalMoveCoordinate(obj, coordinate)
% [result, auxiliary] = IsLegalMoveCoordinate(obj, coordinate)
%
% Determine whether placing a piece belonging to the player (specified by
% `obj.PlayerTurn`) at `coordinate` on the board is a legal move
%
% ==========
% Parameters
% ==========
%     `coordinate`: The coordinate of the desired move
%
% =======
% Returns
% =======
%     `result`:
%         - Whether placing a piece belonging to the player specified by
%           `obj.PlayerTurn` at `coordinate` on the board is a legal move
%
%     `auxiliary`:
%         - Struct with the following values:
%             `flankEndpoints`:
%                 - Flank endpoints of the first legal move found
%                 - This value should only be used when `result` is true

import Othello.BoardWrapper;

result = true;
auxiliary = struct;

% Ensure that the coordinate is on the board
if (~obj.Board.IsOnBoard(coordinate))
    result = false;
    return
end

% Ensure that the coordinate is empty
if (obj.Board.GetSpace(coordinate) ~= BoardWrapper.EMPTY_PIECE)
    result = false;
    return;
end

% Ensure that the coordinate is a flanking move.
%     - The player turn is equivalent to the index of the player's piece
[isFlankingMove, auxiliaries.IsFlankingMove] = ...
    obj.Board.IsFlankingMove(coordinate, obj.PlayerTurn);

% Matlab has no built-in function to merge structs. So we'll just do this
% manually
auxiliary.flankEndpoints = auxiliaries.IsFlankingMove.flankEndpoints;

if (~isFlankingMove)
    result = false;
    return;
end
