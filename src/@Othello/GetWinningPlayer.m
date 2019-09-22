function player = GetWinningPlayer(obj)
% player = GetWinningPlayer(obj)
%
% Gets the winning player
%
% =======
% Returns
% =======
%
%     - `player`
%         - `-1` if a player deliberately quits before game ends naturally
%         - `0` if there is a tie
%         - Otherwise, it's equal to the player turn of the winner

if (obj.PlayerWantsToQuit == true)
    player = -1;
    return;
end

pieceCount = zeros(1, obj.AMOUNT_OF_PLAYERS);
for i = 1:obj.AMOUNT_OF_PLAYERS
    pieceCount(i) = obj.Board.CountSpacesWithPiece(i);
end

% `max` returns the index in the second return value
[maxPieces, player] = max(pieceCount);

% There could be a tie
if (maxPieces == min(pieceCount))
    player = 0;
end
