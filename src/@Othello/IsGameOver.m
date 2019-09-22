function result = IsGameOver(obj)
% result = IsGameOver(obj)

if (obj.PlayerWantsToQuit)
    result = true;
    return;
end

if (obj.NoPlayersCanMove)
    result = true;
    return;
end

result = false;
