classdef BoardWrapper < handle
    properties (Access = public)
        FigureHandle
        ImageHandle
    end

    properties (Access = public, Constant)
        EMPTY_PIECE = 0
    end

    properties (Access = private, Constant)
        % Number of spaces along the X and Y axes of the board
        NUM_SPACES_AXIS = 8

        SPACE_WIDTH = 20
        BORDER_WIDTH = 2

        % Pixel amount that the axes are offset from the image. This is just a
        % guess, but it seems like it works
        AXES_OFFSET = [0.5, 0.5]

        BOARD_SPACE_COLOR = [0.35, 0.65, 0.7];
        BOARD_BORDER_COLOR = [0.05, 0.05, 0.05];

        % Color abbreviations of plot markers
        PIECE_COLORS = ['k', 'w']
    end

    properties (Access = private)
        % Model of the board depicted as a simple 2D matrix.
        BoardModel

        % Pre-calculated translational vectors (steps) for the possible
        % flanking paths
        FlankSteps
    end

    methods (Access = public)
        function obj = BoardWrapper()
            obj.InitializeBoard();
            obj.MakeFlankSteps();
            obj.MakeBoardModel();
            obj.SetStartingPieces();
        end

        Close(obj)

        boardSize = GetBoardSize(obj)

        SetSpaceWithFlanks(obj, coordinate, flankEndpoints, playerPiece)
        piece = GetSpace(obj, coordinate)

        % Callback
        GetSpaceCoordinatesOnClick(obj, src, ~)

        [result, auxiliary] = IsFlankingMove(obj, coordinate, playerPiece)

        result = IsOnBoard(obj, coordinate)

        count = CountSpacesWithPiece(obj, piece);
    end

    methods (Access = private)
        InitializeBoard(obj)
        SetStartingPieces(obj);

        SetSpace(obj, coordinate, piece)
        MakeBoardModel(obj)

        flankEndpoints = GetEndpointsOfFlanks(obj, coordinate, playerPiece)
        FillFlanks(obj, coordinate, flankEndpoints, playerPiece)

        MakeFlankSteps(obj)
    end
end
