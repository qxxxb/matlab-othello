function SetNextPlayerTurn(obj)
% SetNextPlayerTurn(obj)

if (obj.PlayerTurn == obj.AMOUNT_OF_PLAYERS)
    obj.PlayerTurn = 1;
else
    obj.PlayerTurn = obj.PlayerTurn + 1;
end
