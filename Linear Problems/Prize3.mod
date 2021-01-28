
# We go from 1 to 12

var K_pos {1..12 ,1..12} binary ;   # We go up untill 12 because later on we need some -2 indices
var Covered {1..12 ,1..12} binary ;



minimize Number_knights: sum {i in 1..12,j in 1..12} K_pos[i,j];


subject to all_covered: sum {i in 3..10,j in 3..10} Covered[i,j] >= 64;


# subject to test_DELETE: sum {i in 3..10,j in 3..10} K_pos[i,j] >= 64;
subject to no_knights_outiside_chessboard_1: sum {i in 1..2,j in 1..12} K_pos[i,j] <= 0;
subject to no_knights_outiside_chessboard_2: sum {i in 1..12,j in 1..2} K_pos[i,j] <= 0;
subject to no_knights_outiside_chessboard_3: sum {i in 11..12,j in 1..12} K_pos[i,j] <= 0;
subject to no_knights_outiside_chessboard_4: sum {i in 1..12,j in 11..12} K_pos[i,j] <= 0;


subject to knight_cover {i in 3..10,j in 3..10}: Covered[i,j] <= K_pos[i,j] + K_pos[i+1,j-2] + K_pos[i+2,j-1] + K_pos[i+2,j+1] + K_pos[i+1,j+2] +K_pos[i-1,j+2] + K_pos[i-2,j+1] + K_pos[i-2,j-1] + K_pos[i-1,j-2] ;
