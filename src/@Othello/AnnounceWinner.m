function AnnounceWinner(obj, winner)
% AnnounceWinner(obj, winner)

if (winner < 0 || winner > obj.AMOUNT_OF_PLAYERS)
    return;
end

if (winner == 0)
    message = 'Draw!';
else
    message = [obj.PlayerNames{winner}, ' wins!'];
end

uiwait( ...
    msgbox( ...
        message, ...
        'Othello', ...
        'modal' ...
    ) ...
);
