enum Direction { north, east, south, west }

class Robot {
  int x;
  int y;
  Direction direction;

  Robot(this.x, this.y, this.direction);

  void turnRight() {
    direction = Direction.values[(direction.index + 1) % 4];
  }

  void turnLeft() {
    direction = Direction.values[(direction.index + 3) % 4];
  }

  void move() {
    switch (direction) {
      case Direction.north:
        y += 1;
        break;
      case Direction.east:
        x += 1;
        break;
      case Direction.south:
        y -= 1;
        break;
      case Direction.west:
        x -= 1;
        break;
    }
  }

  void proceedInstructions(String instructions) {
    for (var ch in instructions.split('')) {
      switch (ch) {
        case 'R':
          turnRight();
          break;
        case 'L':
          turnLeft();
          break;
        case 'A':
          move();
          break;
        default:
          break;
      }
    }
  }

  @override
  String toString() {
    return 'Final position: {$x, $y}\nFacing: ${direction.toString().split('.').last.toUpperCase()}';
  }
}

void main() {
  // Initial position {7, 3} and facing north
  int x = 2;
  int y = 5;
  Direction direction = Direction.south;

  // Example instruction sequence
  const instructions = "RRAAAAALA";

  Robot robot = Robot(x, y, direction);
  robot.proceedInstructions(instructions);
  print(robot);
  
  // Process the instructions and get the final position and direction
  // Direction turnRight(Direction d) => Direction.values[(d.index + 1) % 4];
  // Direction turnLeft(Direction d) => Direction.values[(d.index + 3) % 4];

  // for (var ch in instructions.split('')) {
  //   switch (ch) {
  //     case 'R':
  //       direction = turnRight(direction);
  //       break;
  //     case 'L':
  //       direction = turnLeft(direction);
  //       break;
  //     case 'A':
  //       switch (direction) {
  //         case Direction.north:
  //           y += 1;
  //           break;
  //         case Direction.east:
  //           x += 1;
  //           break;
  //         case Direction.south:
  //           y -= 1;
  //           break;
  //         case Direction.west:
  //           x -= 1;
  //           break;
  //       }
  //       break;
  //     default:
  //       break;
  //   }
  // }

  // Print the final position and direction
  // print('Final position: {$x, $y}');
  // print('Facing: ${direction.toString().split('.').last.toUpperCase()}');
}
