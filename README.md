# MATLAB Maze Solver: Left-Hand Rule & Path Optimization

This project implements an autonomous navigation system in MATLAB that solves randomly generated mazes. It utilizes the Left-Hand Rule algorithm for navigation and features a custom post-processing algorithm to optimize the final path by removing redundant loops and dead-end traversals.

--------------------------------------------

## Project Structure

MATLAB_Maze_Solver/
│

├── MATLAB_Project_Maze.m      (main navigation and optimization script)

├── generate_maze.m            (function to generate random maze structures)

├── .gitignore                 (ignores autosave and large video files)

└── LeftHandSolution.avi       (exported video of the optimized solution)

--------------------------------------------

## Key Features

* **Dynamic Maze Generation**: Calls a custom function to generate a completely random maze layout on every run, including randomized entrance and exit points and guaranteed border walls.
* **Left-Hand Rule Algorithm**: Implements a robust navigation strategy using modular arithmetic and direction vectors for efficient movement.
* **Path Optimization**: Features a custom algorithm that iterates through the navigation history to identify and remove redundant loops or backtracking, resulting in the most efficient route from start to finish.
* **Automated Video Generation**: Uses the `VideoWriter` class to automatically export the solved maze as an `.avi` file for external review.
* **Live Visualization**: Provides a real-time graphical display of the robot's progress during the solving phase.

--------------------------------------------

## How It Works

1. **Maze Generation**: The script calls `generate_maze()` to create a unique environment with guaranteed boundary walls.
2. **Navigation**: The robot follows the left-hand wall. If a left turn is possible, it takes it; otherwise, it attempts to move forward, then right, or backward as a last resort.
3. **Optimization**: Once the exit is reached, the script analyzes the `path_row` and `path_col` arrays to delete any steps spent in dead ends or circular paths.
4. **Output**: The optimized path is rendered into a video titled `LeftHandSolution.avi`.

--------------------------------------------

## Technical Implementation

The project demonstrates several intermediate-to-advanced MATLAB concepts:
* **Modular Arithmetic**: Used to manage the robot's "facing" direction without complex nested conditionals.
* **Vectorized Coordinate Checks**: Ensures all moves are within the maze boundaries before execution to prevent runtime errors.
* **Dynamic Array Manipulation**: Used during the backward iteration process to prune the navigation history.

--------------------------------------------

## How to Run

**Requirements:**
- MATLAB
- MATLAB_Project_Maze.m
- generate_maze.m

Steps:
1. Open MATLAB
2. Set Current Folder to this project directory
3. Run: MATLAB_Project_Maze
4. View the live navigation in the figure window
5. Find the exported LeftHandSolution.avi in the project folder

--------------------------------------------

## Skills Demonstrated

- Algorithm Development: Implementation of the Left-Hand Rule and custom path pruning
- MATLAB Programming: Proficiency with modular arithmetic, logic branching, and loops
- Data Post-Processing: Cleaning raw navigation history to extract the most efficient route
- Graphics & Visualization: Creating live plots and exporting media using VideoWriter
- Boundary Handling: Implementing coordinate checks to prevent array index errors

--------------------------------------------

## Possible Extensions

- Implement a "Breadth-First Search" (BFS) to compare the optimized Left-Hand path with the absolute shortest path.
- Add a Graphical User Interface (GUI) to allow users to set maze dimensions.
- Support for complex mazes with "islands" where the Left-Hand Rule might fail.
