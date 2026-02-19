clear; clc; clf; close all;
%% Generate the maze (walls at borders guaranteed)
[maze, start_row, start_col, exit_row, exit_col] = generate_maze();
[rows, cols] = size(maze);

%% Navigation setup (Left-Hand Rule)
directions = [-1 0; 0 -1; 1 0; 0 1];  % Up, Right, Down, Left
facing = 1;  % Initial direction: Up
current_row = start_row;
current_col = start_col;
steps = 0;

% Path recording
path_row = start_row;
path_col = start_col;

%% Solve maze using left-hand rule
while ~(current_row == exit_row && current_col == exit_col)
    % Calculate possible moves with boundary checks
    % Left move
    left_dir = mod(facing-2, 4) + 1;
    left_row = current_row + directions(left_dir, 1);
    left_col = current_col + directions(left_dir, 2);
    valid_left = (left_row >= 1 && left_row <= rows && left_col >= 1 && left_col <= cols) && ...
                 (maze(left_row, left_col) == 0 || (left_row == exit_row && left_col == exit_col));
    
    % Forward move
    forward_row = current_row + directions(facing, 1);
    forward_col = current_col + directions(facing, 2);
    valid_forward = (forward_row >= 1 && forward_row <= rows && forward_col >= 1 && forward_col <= cols) && ...
                    (maze(forward_row, forward_col) == 0 || (forward_row == exit_row && forward_col == exit_col));
    
    % Right move
    right_dir = mod(facing, 4) + 1;
    right_row = current_row + directions(right_dir, 1);
    right_col = current_col + directions(right_dir, 2);
    valid_right = (right_row >= 1 && right_row <= rows && right_col >= 1 && right_col <= cols) && ...
                  (maze(right_row, right_col)) == 0 || (right_row == exit_row && right_col == exit_col);
    
    % Backward move
    back_dir = mod(facing+1, 4) + 1;
    back_row = current_row + directions(back_dir, 1);
    back_col = current_col + directions(back_dir, 2);
    valid_back = (back_row >= 1 && back_row <= rows && back_col >= 1 && back_col <= cols) && ...
                 (maze(back_row, back_col)) == 0 || (back_row == exit_row && back_col == exit_col);

    % Left-hand rule decision hierarchy
    if valid_left
        facing = left_dir;
        current_row = left_row;
        current_col = left_col;
    elseif valid_forward
        current_row = forward_row;
        current_col = forward_col;
    elseif valid_right
        facing = right_dir;
        current_row = right_row;
        current_col = right_col;
    elseif valid_back
        facing = back_dir;
        current_row = back_row;
        current_col = back_col;
    end

    steps = steps + 1;
    path_row(end+1) = current_row;
    path_col(end+1) = current_col;

    % Live visualization
    temp_maze = maze;
    temp_maze(current_row, current_col) = 2;  % Mark current position as yellow
    map = [1 1 1; 0 0 0; 234/255 170/255 0/255];  % White, Black, Yellow
    colormap(map);
    image(temp_maze+1);
    text(start_col-0.35, start_row, 'S', 'fontsize', 22, 'color', 'g', 'FontWeight', 'bold');
    text(exit_col-0.35, exit_row, 'X', 'fontsize', 22, 'color', 'r', 'FontWeight', 'bold');
    title('Left-Hand Rule Navigation');
    drawnow limitrate;
end

%% Remove redundant loops from path (backward iteration)
i = length(path_row);
while i > 1
    for j = 1:i-1
        if path_row(i) == path_row(j) && path_col(i) == path_col(j)
            path_row(j+1:i) = [];
            path_col(j+1:i) = [];
            i = length(path_row);  % Reset after deletion
            break;
        end
    end
    i = i - 1;
end

%% Create video with shortest path (yellow)
figure(1);
set(gcf, 'Position', get(0, 'Screensize'));
MazeSolve = VideoWriter('LeftHandSolution.avi');
open(MazeSolve);
colormap([1 1 1; 0 0 0; 234/255 170/255 0/255]);

maze_copy = maze;
for k = 1:length(path_row)
    maze_copy(path_row(k), path_col(k)) = 2;  % Mark path yellow
    image(maze_copy+1);
    text(start_col-0.35, start_row, 'S', 'fontsize', 22, 'color', 'g', 'FontWeight', 'bold');
    text(exit_col-0.35, exit_row, 'X', 'fontsize', 22, 'color', 'r', 'FontWeight', 'bold');
    drawnow limitrate;
    writeVideo(MazeSolve, getframe(gcf));
end
close(MazeSolve);

fprintf('Steps taken: %d (raw), %d (optimized)\n', steps, length(path_row)-1);
