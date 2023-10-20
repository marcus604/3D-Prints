// hose inner diameter [mm]
HID = 53.2;

// hose wall thickness [mm]
HWL = 4;

// receiving end inner diameter [mm]
RID = 49.41;

LENGTH = 36;
TAPER = 0.75;

$fn=80;

difference() {
  union() { 
    translate([0,0,0])  cylinder(h = LENGTH, d2 = RID+TAPER, d1 = RID-TAPER);
    translate([0,0,LENGTH])  cylinder(h = LENGTH, d2 = HID-TAPER, d1 = HID+TAPER);
    translate([0,0,LENGTH-1.8])  cylinder(h = 5, d2 = HID+2*HWL, d1 = RID+0.5);    
  }    
  translate([0,0,-1])  cylinder(h = 82, d = RID-7);
}
