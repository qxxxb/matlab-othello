function GetSpaceCoordinatesOnClick(obj, src, ~)
% GetSpaceCoordinatesOnClick(obj, src, ~)

axesHandle = get(src, 'Parent');
rawCoordinates = get(axesHandle, 'CurrentPoint');
rawCoordinates = rawCoordinates(1, 1:2);

% Get move coordinates {{{

fullSpaceWidth = obj.SPACE_WIDTH + obj.BORDER_WIDTH;
moveCoordinates = zeros(size(rawCoordinates));

for i = 1:numel(rawCoordinates)
    x = floor((rawCoordinates(i) / fullSpaceWidth) + 1);
    moveCoordinates(i) = min(x, obj.NUM_SPACES_AXIS);
end

% Must be flipped to follow `[row, column]` convention
moveCoordinates = fliplr(moveCoordinates);

% }}}

transfer = guidata(src);

transfer.moveCoordinates = moveCoordinates;
transfer.playerHasSelectedSpace = true;

guidata(src, transfer);
