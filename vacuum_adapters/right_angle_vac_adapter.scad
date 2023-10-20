$fn=40;

wallThickness = 6;
cycloneInnerDiameter = 50;
hoseInnerDiameter = 53.2;
outer_diameter = 53.2;
inner_diameter = 50;
taper = 0.75;
length = 60; // Total length of the adapter
bend_radius = 1; // Radius of the bend


module main() {

    difference() {
        
        union() {
            // Create the cylone intake
            translate([0,0,0]) 
                cylinder(h=length, d2=cycloneInnerDiameter-taper, d1=cycloneInnerDiameter+taper);
                        
            // Create the vac intake
            translate([0,length,0]) 
                rotate([90, 0, 0])
                    cylinder(h=length, d2=hoseInnerDiameter+taper, d1=hoseInnerDiameter-taper);
            
            // Create the bend
            for (i = [0 : 1 : 90])
                translate([0, 0, 0])
                    rotate([i, 0, 0]) {
                        difference() {
                            cylinder(h=bend_radius, d=hoseInnerDiameter+taper);
                            translate([-(hoseInnerDiameter+taper)/2, 0, 0]) cube([hoseInnerDiameter+taper, hoseInnerDiameter+taper, hoseInnerDiameter+taper]);
                            cylinder(h=bend_radius, d=(hoseInnerDiameter+taper)-wallThickness); //Hollow out bend
                        }
                    }
        }
        
        //Hollow out intakes
        union() {
            
            translate([0,0,0]) 
                cylinder(h=length, d2=cycloneInnerDiameter-taper-wallThickness, d1=cycloneInnerDiameter+taper-wallThickness);
            
            translate([0,length,0]) 
                rotate([90, 0, 0])
                    cylinder(h=length, d2=hoseInnerDiameter-taper-wallThickness, d1=hoseInnerDiameter+taper-wallThickness);           
        }
    }
}

main();
