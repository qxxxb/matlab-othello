classdef Othello < Game
    properties (Access = private)
        Board
        PlayerWantsToQuit = false
        NoPlayersCanMove = false
        PlayerNames
    end

    properties (Access = private, Constant)
        INPUT_DELAY = 0.02;
    end

    methods (Access = public)
        function obj = Othello(playerNames)
            obj.PlayerNames = playerNames;
        end

        Close(obj)
    end

    methods (Access = protected)
        Initialize(obj)
        move = GetPlayerMoveCoordinates(obj)
        MakePlayerMove(obj)
        DisplayStatus(obj)
        result = IsGameOver(obj)
        player = GetWinningPlayer(obj)
        AnnounceWinner(obj, winner)
    end

    methods (Access = private)
        [result, auxiliary] = IsLegalMoveCoordinate(obj, coordinate)
        [result, auxiliary] = CanPlayerMove(obj)
        [result, auxiliary] = CanPlayersMove(obj)
    end
end
