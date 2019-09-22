function result = IsOnBoard(obj, coordinate)
% result = IsOnBoard(obj, coordinate)

s = size(obj.BoardModel);
for i = 1:numel(s)
    if (coordinate(i) < 1 || coordinate(i) > s(i))
        result = false;
        return;
    end
end

result = true;
