function [result, auxiliary] = CanPlayersMove(obj)
% [result, auxiliary] = CanPlayersMove(obj)
%
% Determine whether the players have available moves
%
% =======
% Returns
% =======
%     `result`:
%         - Vector containing booleans for each player
%         - Each boolean contains the result of `CanPlayerMove` for each player
%
%     `auxiliary`:
%         - Struct containing the same auxiliary info from `CanPlayerMove`
%           for the current player

result = zeros(1, obj.AMOUNT_OF_PLAYERS);
originalPlayer = obj.PlayerTurn;

while (true)
    obj.SetNextPlayerTurn();

    [result(obj.PlayerTurn), temp] = obj.CanPlayerMove();

    if (obj.PlayerTurn == originalPlayer)
        % We need the auxiliary information from `CanPlayerMove` only for the
        % original player
        auxiliary = temp;
        break;
    end
end
