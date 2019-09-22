classdef (Abstract) Game < handle
    properties (Access = public, Constant)
        AMOUNT_OF_PLAYERS = 2
    end

    properties (Access = protected)
        PlayerTurn = 1
    end

    methods (Access = public)
        winner = Play(obj)
    end

    methods (Access = protected)
        Initialize(obj)
        MakePlayerMove(obj)
        SetNextPlayerTurn(obj)
        AnnounceWinner(obj, winner)
    end

    methods (Access = protected, Abstract)
        DisplayStatus(obj)
        result = IsGameOver(obj)
        player = GetWinningPlayer(obj)
    end
end
