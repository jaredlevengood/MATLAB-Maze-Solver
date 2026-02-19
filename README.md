# MATLAB Maze Solver: Left-Hand Rule with Path Optimization

This repository contains a MATLAB-based autonomous navigation system that solves randomly generated mazes using the **Left-Hand Rule algorithm**. Beyond simple navigation, the system includes a post-processing stage to optimize the path and a visualization engine to export the solution as a video.

# MATLAB Maze Solver: Left-Hand Rule & Path Optimization

This project implements an autonomous navigation system in MATLAB that solves randomly generated mazes. It utilizes the Left-Hand Rule algorithm for navigation and features a custom post-processing algorithm to optimize the final path by removing redundant loops and dead-end traversals.

--------------------------------------------

## Project Structure

```text
MATLAB_Maze_Solver/
│
├── MATLAB_Project_Maze.m      (main navigation and optimization script)
├── generate_maze.m            (function to generate random maze structures)
├── .gitignore                 (ignores autosave and large video files)
└── LeftHandSolution.avi       (exported video of the optimized solution)
## Key Features

* **Left-Hand Rule Algorithm**: Implements a robust navigation strategy using modular arithmetic and direction vectors for efficient movement.
* **Path Optimization**: Features a custom algorithm that iterates through the navigation history to identify and remove redundant loops or backtracking, resulting in the most efficient route from start to finish.
* **Automated Video Generation**: Uses the `VideoWriter` class to automatically export the solved maze as an `.avi` file for external review.
* **Live Visualization**: Provides a real-time graphical display of the robot's progress during the solving phase.

## How It Works

1. **Maze Generation**: The script calls `generate_maze()` to create a unique environment with guaranteed boundary walls.
2. **Navigation**: The robot follows the left-hand wall. If a left turn is possible, it takes it; otherwise, it attempts to move forward, then right, or backward as a last resort.
3. **Optimization**: Once the exit is reached, the script analyzes the `path_row` and `path_col` arrays to delete any steps spent in dead ends or circular paths.
4. **Output**: The optimized path is rendered into a video titled `LeftHandSolution.avi`.

## Technical Implementation

The project demonstrates several intermediate-to-advanced MATLAB concepts:
* **Modular Arithmetic**: Used to manage the robot's "facing" direction without complex nested conditionals.
* **Vectorized Coordinate Checks**: Ensures all moves are within the maze boundaries before execution to prevent runtime errors.
* **Dynamic Array Manipulation**: Used during the backward iteration process to prune the navigation history.

## Files

* `MATLAB_Project_Maze.m`: The main execution script.
* `generate_maze.m`: The required function to generate the maze structure (must be in the same directory).
