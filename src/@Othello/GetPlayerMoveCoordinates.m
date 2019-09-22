function moveCoordinates = GetPlayerMoveCoordinates(obj)
% moveCoordinates = GetPlayerMoveCoordinates(obj)
%
% Get the coordinates of the move specified by the player. If the figure window
% is closed (i.e. the player chose to quit), `moveCoordinates` is `-1`
%
% =======
% Returns
% =======
%
%     - `moveCoordinates`
%         - Coordinates of the move specified by the player
%         - If the figure window is closed (i.e. the player chose to quit), the
%           value is `-1`

% Create a transfer struct, so that we can transfer data between the callback
% and this function
transfer = guihandles(obj.Board.FigureHandle);

transfer.playerHasSelectedSpace = false;
transfer.moveCoordinates = [];

guidata(obj.Board.FigureHandle, transfer);

board = obj.Board;
set(obj.Board.ImageHandle, 'ButtonDownFcn', @board.GetSpaceCoordinatesOnClick)

while (true)
    % Check if the figure window is closed
    if (~ishandle(obj.Board.FigureHandle))
        obj.PlayerWantsToQuit = true;
        moveCoordinates = -1;
        return;
    end

    % Update the transfer struct
    transfer = guidata(obj.Board.FigureHandle);
    pause(obj.INPUT_DELAY);

    if (transfer.playerHasSelectedSpace)
        break;
    end
end

moveCoordinates = transfer.moveCoordinates;
