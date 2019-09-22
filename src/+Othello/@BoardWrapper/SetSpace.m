function SetSpace(obj, coordinate, piece)
% SetSpace(obj, coordinate, piece)

obj.BoardModel(coordinate(1), coordinate(2)) = piece;

fullSpaceWidth = obj.SPACE_WIDTH + obj.BORDER_WIDTH;

plotCoordinate = zeros(size(coordinate));
for i = 1:numel(coordinate)
    plotCoordinate(i) = (coordinate(i) * fullSpaceWidth) - (obj.SPACE_WIDTH / 2);
    plotCoordinate(i) = plotCoordinate(i) + obj.AXES_OFFSET(i);
end

% Must be swapped to accommodate with `[row, column]` convention
plotCoordinate = fliplr(plotCoordinate);

pieceColor = obj.PIECE_COLORS(piece);

% Draw piece shadow first
shadowCoordinate = plotCoordinate + [1, 1];
shadowColor = obj.BOARD_SPACE_COLOR ./ (1.5);
plot( ...
    shadowCoordinate(1), ...
    shadowCoordinate(2), ...
    '.', ...
    'MarkerEdgeColor', shadowColor, ...
    'MarkerSize', 130 ...
);

plot( ...
    plotCoordinate(1), ...
    plotCoordinate(2), ...
    [pieceColor, '.'], ...
    'MarkerSize', 130 ...
);