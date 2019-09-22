function count = CountSpacesWithPiece(obj, piece)
% count = CountSpacesWithPiece(obj, piece)

count = 0;
% Note: we could use linear indexing, but that would mean I have to allow
% `GetSpace` to accept a linear index
s = obj.GetBoardSize();
for i = 1:s(1)
    for j = 1:s(2)
        coordinate = [i, j];
        if (obj.GetSpace(coordinate) == piece)
            count = count + 1;
        end
    end
end
