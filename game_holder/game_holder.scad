//User Variables

now_playing_cover = true;
cover_right_side = true;

num_of_disks = 5;
tolerance = 0.1; //Bambulab P1S PLA = 0.1


//DONT CHANGE THESE
//Variables 
game_width = 15.12 + tolerance;
game_thickness = 135.86 + tolerance;

cover_width = 20;
cover_thickness = 145;

height = 16.5;
walls = 3;
base_thickness = 1;
distance_between_slots = (game_width + (walls / 2));

module game_slot (x, y, is_it_cover) {    
    union() {
        difference() {
            translate([x,y,0]) cube([(game_width + walls), (game_thickness + walls), height]);
            translate([(x+(walls/2)),(y+(walls/2)),0]) cube([game_width, game_thickness, height]);
        }
        translate([x,y,0]) cube([(game_width + walls), (game_thickness + walls), base_thickness]);
    }
}

if (now_playing_cover) {
   if (cover_right_side) {
       game_slot(0,0, true);
   } else {
       game_slot(0,-((game_thickness + (walls / 2)) + (num_of_disks * (game_width + (walls / 2)))), true);
   }
}

for (i = [1:1:num_of_disks]) {
    rotate([0,0,90]) game_slot(-(distance_between_slots*i),-(game_width+walls), false); 
}
