# Maze-Generator
A maze generator following Daniel Shiffman's tutorial on the Coding Train YouTube channel.
This maze generator runs on Java, visualized on Processing. It incorperates randomized depth-first search, backtracking, and a stack in order to generate the maze. Will be implementing several path finding algorithms(breadth first search, dikstra's, a*) on top of this maze to solve the mazes.

Currently allows the user to serialize their maze. But if the maze has too many nodes, serialization will throw a stack overflow error since the call stack will be too large for Processing to handle.


