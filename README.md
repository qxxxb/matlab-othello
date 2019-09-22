# MATLAB Othello

![screenshot](https://raw.githubusercontent.com/qxxxb/matlab-othello/assets/screenshot.png)

Two-player Othello in MATLAB. This was for my team's software design project
for ENGR 1181 at OSU.

## Usage

Clone and extract the repository. Open up MATLAB and `cd` to the `src`
directory. Run `Main` to start playing.

The rules of Othello are:
- Black moves first
- Each move must flank at least one of the opponent’s disks, thereby capturing
  them
- Players take turn placing disks
- If a player has no available moves, his/her turn is skipped
- The game ends when both players have no available moves
- The player with the most remaining disks on the board wins

To place a disk, click on the desired space on the board. If the move is legal,
the disk will be placed and the appropriate pieces will be captured. If not,
nothing will happen.
