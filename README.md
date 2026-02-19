# MATLAB Maze Solver: Left-Hand Rule & Path Optimization

This project implements an autonomous navigation system in MATLAB that solves randomly generated mazes. It utilizes the Left-Hand Rule algorithm for navigation and features a custom post-processing algorithm to optimize the final path by removing redundant loops and dead-end traversals.

--------------------------------------------

## Demo

<div align="center">
  <video src="https://github.com/user-attachments/assets/c44752be-055d-4057-8102-98ab30b74ffa" width="100%" controls autoplay muted playsinline loop>
    Your browser does not support the video tag.
  </video>
</div>

--------------------------------------------


## Project Structure

* `Autonomous_Maze_Solver.m`: The main navigation and optimization script.
* `generate_maze.m`: The function to generate random maze structures.
* `.gitignore`: Ignores autosave and large video files.
* `LeftHandSolution.mp4`: The exported video of the optimized solution (generated after running).

--------------------------------------------

## Key Features

* **Dynamic Maze Generation**: Calls a custom function to generate a completely random maze layout on every run, including randomized entrance and exit points and guaranteed border walls.
* **Left-Hand Rule Algorithm**: Implements a robust navigation strategy using modular arithmetic and direction vectors for efficient movement.
* **Path Optimization**: Features a custom algorithm that iterates through the navigation history to identify and remove redundant loops or backtracking, resulting in the most efficient route from start to finish.
* **Automated Video Generation**: Uses the `VideoWriter` class to automatically export the solved maze as an `.mp4` file for external review.
* **Live Visualization**: Provides a real-time graphical display of the robot's progress during the solving phase.

--------------------------------------------

## What the Script Does

1. **Generates the Maze**: Calls `generate_maze.m` to create the grid.
2. **Navigates (Left-Hand Rule)**: The robot continuously checks its immediate surroundings, prioritizing moves in this order: Left, Forward, Right, Backward (Dead End).
3. **Records the Path**: Logs every coordinate visited during the raw traversal.
4. **Optimizes the Route**: Performs a backward iteration through the coordinate history to identify and delete redundant loops.
5. **Visualizes & Exports**: Generates a live plot of the robot's movement and exports the final, optimized path as a video.

--------------------------------------------

## How to Run

**Requirements:**
- MATLAB
- `Autonomous_Maze_Solver.m`
- `generate_maze.m`

**Steps:**
1. Open MATLAB
2. Set Current Folder to this project directory
3. Run: `Autonomous_Maze_Solver.m`
4. View the live navigation in the figure window
5. Find the exported `LeftHandSolution.mp4` in the project folder

--------------------------------------------

## Skills Demonstrated

- **Algorithm Development**: Implementation of the Left-Hand Rule and custom path pruning.
- **MATLAB Programming**: Proficiency with modular arithmetic, logic branching, and loops.
- **Data Post-Processing**: Cleaning raw navigation history to extract the most efficient route.
- **Graphics & Visualization**: Creating live plots and exporting media using `VideoWriter`.
- **Boundary Handling**: Implementing coordinate checks to prevent array index errors.

--------------------------------------------

## Possible Extensions

- Implement a "Breadth-First Search" (BFS) to compare the optimized Left-Hand path with the absolute shortest path.
- Add a Graphical User Interface (GUI) to allow users to set maze dimensions.
- Support for complex mazes with "islands" where the Left-Hand Rule might fail.
