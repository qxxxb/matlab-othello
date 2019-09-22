function FillFlanks(obj, coordinate, flankEndpoints, playerPiece)
% FillFlanks(obj, coordinate, flankEndpoints, playerPiece)

for i = 1:numel(flankEndpoints)
    flankEndpoint = flankEndpoints{i};

    if (isempty(flankEndpoint))
        continue;
    end

    % Fill all the cells between `coordinate` and the `flankEndpoint` {{{

    step = obj.FlankSteps{i};
    stepCoordinate = coordinate;

    while (true)
        stepCoordinate = stepCoordinate + step;

        if (stepCoordinate == flankEndpoint)
            break;
        end

        obj.SetSpace(stepCoordinate, playerPiece);
    end

    % }}}
end
