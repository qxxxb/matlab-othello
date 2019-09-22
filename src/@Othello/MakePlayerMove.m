function MakePlayerMove(obj)
% MakePlayerMove(obj)
%
% Make the player specify a legal move, then execute it

% Check if there are any available moves {{{

[canPlayersMove, auxiliaries.CanPlayersMove] = obj.CanPlayersMove();
% If `canPlayersMove[obj.PlayerTurn]` is true, then
% `auxiliaries.CanPlayersMove` will contain the coordinate (and other auxiliary
% information such as flank endpoints) of a legal move. If the player happens
% to pick the same coordinate, then we do not have to check again whether the
% coordinate was a legal move, and we can use the information from
% `auxiliaries.CanPlayersMove` to execute the move. This is only a minor
% optimization

% [canPlayerMove, auxiliaries.CanPlayerMove] = obj.CanPlayerMove();

% Check is nobody can move. If so, then the game is over.
if (max(canPlayersMove) == false)
    % This flag will be caught in `obj.IsGameOver`
    obj.NoPlayersCanMove = true;
    return;
end

if (~canPlayersMove(obj.PlayerTurn))
    uiwait( ...
        msgbox( ...
            'You have no available moves, so your turn will be passed', ...
            'Othello', ...
            'modal' ...
        ) ...
    );

    return;
end

% }}}

% Keep asking for a move until a legal move is received {{{

while (true)
    coordinate = obj.GetPlayerMoveCoordinates();

    % Check if the player chose to quit. `-1` is the flag for this
    if (coordinate == -1)
        return;
    end

    % See the comments when we called `CanPlayersMove` above. Here we check
    % if the coordinates are equal, and if they are, we can immediately
    % assume that the move is legal and therefore leave the loop
    if (coordinate == auxiliaries.CanPlayersMove.coordinate)
        flankEndpoints = auxiliaries.CanPlayersMove.flankEndpoints;
        break;
    end

    [isLegalMove, auxiliaries.IsLegalCoordinate] = ...
        obj.IsLegalMoveCoordinate(coordinate);
    %
    if (isLegalMove)
        flankEndpoints = auxiliaries.IsLegalCoordinate.flankEndpoints;
        break;
    end

    % At this point, the conditions for the move being legal have not been
    % satisified, so we have to try again
end

% }}}

% Execute the move. Note that `PlayerTurn` corresponds to the player's piece
% index
obj.Board.SetSpaceWithFlanks( ...
    coordinate,               ...
    flankEndpoints,           ...
    obj.PlayerTurn            ...
);
