function winner = Play(obj)
% winner = Player(obj)

obj.Initialize();

while (~obj.IsGameOver())
    obj.DisplayStatus();
    obj.MakePlayerMove();
    obj.SetNextPlayerTurn();
end

winner = obj.GetWinningPlayer();
obj.AnnounceWinner(winner);
