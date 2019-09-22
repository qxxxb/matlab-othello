function InitializeBoard(obj)
% InitializeBoard(obj)

obj.FigureHandle = figure( ...
    'Name', 'Othello', ...
    'NumberTitle', 'off', ...
    'MenuBar', 'none', ...
    'OuterPosition', [10, 10, 750, 750], ...
    'Pointer', 'hand' ...
);

numBorders = obj.NUM_SPACES_AXIS + 1;

% In pixels
boardWidth = (obj.SPACE_WIDTH * obj.NUM_SPACES_AXIS) + ...
    (obj.BORDER_WIDTH * numBorders);

% We will create an indexed RGB image, so we start with 1 for the first color
boardImage = ones(boardWidth);

% Draw borders
for i = 1:numBorders
    % The row of pixels on the left side of the border
    borderLeft = (i - 1) * (obj.SPACE_WIDTH + obj.BORDER_WIDTH) + 1;
    % Subtract 1 because the left row of pixels is already considered
    borderRight = borderLeft + obj.BORDER_WIDTH - 1;

    boardImage(borderLeft:borderRight, :) = 2;
    boardImage(:, borderLeft:borderRight) = 2;
end

% We need to configure the axes so that the coordinates we get from clicking on
% the image are accurate {{{

% Fit axes to image
axis image;
% Disable visiblity of axes
axis off;

axes();

% }}}

colormap = [obj.BOARD_SPACE_COLOR; obj.BOARD_BORDER_COLOR];

obj.ImageHandle = imshow( ...
    boardImage, colormap, ...
    'Border', 'tight' ...
);

hold on;
