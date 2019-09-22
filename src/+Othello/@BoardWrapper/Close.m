function Close(obj)
% Close(obj)

% If the figure is open, close it
if (ishandle(obj.FigureHandle))
    close(obj.FigureHandle)
end
