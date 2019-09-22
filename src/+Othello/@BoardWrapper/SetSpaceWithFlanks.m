function SetSpaceWithFlanks(obj, coordinate, flankEndpoints, playerPiece)
% SetSpaceWithFlanks(obj, coordinate, flankEndpoints, playerPiece)

obj.SetSpace(coordinate, playerPiece);
obj.FillFlanks(coordinate, flankEndpoints, playerPiece);
