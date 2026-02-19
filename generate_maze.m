function [maze,start_row,start_col,exit_row,exit_col] = generate_maze()
map = mapMaze(1,1,'MapSize',[50 50],'MapResolution',1);
maze = occupancyMatrix(map);
maze = double(maze);
if maze(:,1) == 1 & maze(:,2) == 1
    maze(:,1) = [];
end
if maze(1,:) == 1 & maze(2,:) == 1
    maze(1,:) = [];
end
[rows,cols] = size(maze);
% Place entrance randomly on one of the exterior walls - check to ensure it
% is reachable
open = 0;
while ~open
    entrance_side = randi(4);  % 1: top, 2: right, 3: bottom, 4: left
    if entrance_side == 1
        entrance_col = randi([2,cols-1]);
        if maze(rows,entrance_col) == 1
            continue
        else
            maze(rows, entrance_col) = 2;  % Entrance
            open = 1;
            entrance_row = rows;
            start_row = rows - 1;
            start_col = entrance_col;
        end
    elseif entrance_side == 2
        entrance_row = randi([2,rows-1]);
        if maze(entrance_row,cols-1) == 1
            continue
        else
            maze(entrance_row, cols) = 2;  % Entrance
            open = 1;
            entrance_col = cols;
            start_row = entrance_row;
            start_col = entrance_col-1;
        end
    elseif entrance_side == 3
        entrance_col = randi([2,cols-1]);
        if maze(2,entrance_col) == 1
            continue
        else
            maze(1, entrance_col) = 2;  % Entrance
            open = 1;
            entrance_row = 1;
            start_row = 2;
            start_col = entrance_col;
        end
    else
        entrance_row = randi([2,rows-1]);
        if maze(entrance_row,2) == 1
            continue
        else
            maze(entrance_row, 1) = 2;  % Entrance
            open = 1;
            entrance_col = 1;
            start_row = entrance_row;
            start_col = 2;
        end
    end
end
% Choose exit side to be on the opposite side of the map
if entrance_side == 1
    exit_side = 3;
elseif entrance_side == 2
    exit_side = 4;
elseif entrance_side == 3
    exit_side = 1;
else
    exit_side = 2;
end
% Place exit
open = 0;
while ~open
    if exit_side == 1
        exit_col = randi([2,cols-1]);
        if maze(rows-1,exit_col) == 1
            continue
        else
            maze(rows, exit_col) = 3;  % Exit
            open = 1;
            exit_row = rows;
        end
    elseif exit_side == 2
        exit_row = randi([2,rows-1]);
        if maze(exit_row,cols-1) == 1
            continue
        else
            maze(exit_row, cols) = 3;  % Exit
            open = 1;
            exit_col = cols;
        end
    elseif exit_side == 3
        exit_col = randi([2,cols-1]);
        if maze(2,exit_col) == 1
            continue
        else
            maze(1, exit_col) = 3;  % Exit
            open = 1;
            exit_row = 1;
        end
    else
        exit_row = randi([2,rows-1]);
        if maze(exit_row,2) == 1
            continue
        else
            maze(exit_row, 1) = 3;  % Exit
            open = 1;
            exit_col = 1;
        end
    end
end
figure(1)
map = [1 1 1; 0 0 0; 0 40/255 85/255];
colormap(map)
image(maze+1)
hold on
title('Starting Maze - S is the starting point; X is the exit')
text(entrance_col-0.35,entrance_row,'S','FontSize',18,'Color','g') % S is the starting point
text(exit_col-0.35,exit_row,'X','FontSize',18,'Color','r') % X is the exit
set(gcf, 'Position', get(0, 'Screensize'));
set(gca, 'Ydir','normal')