/**
 * Martin Egli
 * 2023-01-01
 */

module paper10x6cm() {
    color("White")
    translate([0, 0, 0])
    cube([100, 60, 0.1]);
}

module topCover(loc_res = 32, th = 2) {
    color("lightGray") {
        translate([0, 0, 0])
        difference() {
            hull() {
                translate([-4, -4, 0])
                cylinder(d = 8, h = th, $fn = loc_res);
                translate([100-4, 64+4, 0])
                cylinder(d = 8, h = th, $fn = loc_res);
                translate([100-4, -4, 0])
                cylinder(d = 8, h = th, $fn = loc_res);
                translate([-4, 64+4, 0])
                cylinder(d = 8, h = th, $fn = loc_res);
            
                translate([62.95, 64/2, 0])
                difference() {
                    translate([0, 0, 0])
                    cylinder(d = 160, h = th, $fn = 4*loc_res);
                    translate([-70.5, -80, -1])
                    cube([160, 160, 4]);
                }
            }
            // rounded edge cutout
            translate([152.5, 64/2, -1])
            difference() {
                translate([0, 0, -1.5])
                cylinder(d = 120, h = 5, $fn = 4*loc_res);
                translate([-52, -60, -2])
                cube([120, 120, 7]);
            }
            // M3 holes
            translate([-4, -4, -1])
            cylinder(d = 3, h = th+2, $fn = loc_res);
            translate([100-4, 64+4, -1])
            cylinder(d = 3, h = th+2, $fn = loc_res);
            translate([100-4, -4, -1])
            cylinder(d = 3, h = th+2, $fn = loc_res);
            translate([-4, 64+4, -1])
            cylinder(d = 3, h = th+2, $fn = loc_res);
        }
    }
}

module frame1(loc_res = 32, th = 1.0) {    
    color("LightGreen") {
        difference() {
            //th1
            translate([0, 0, 0]) {
                union() {
                    hull() {
                        translate([-4, -4, 0])
                        cylinder(d = 8, h = th, $fn = loc_res);
                        translate([-4, 64+4, 0])
                        cylinder(d = 8, h = th, $fn = loc_res);
                    
                        translate([62.95, 64/2, 0])
                        difference() {
                            translate([0, 0, 0])
                            cylinder(d = 160, h = th, $fn = 4*loc_res);
                            translate([-70.5, -80, -1])
                            cube([160, 160, 4]);
                        }
                    }
                    hull() {
                        translate([-4, 64+4, 0])
                        cylinder(d = 8, h = th, $fn = loc_res);
                        translate([100-4, 64+4, 0])
                        cylinder(d = 8, h = th, $fn = loc_res);
                    }
                    hull() {
                        translate([-4, -4, 0])
                        cylinder(d = 8, h = th, $fn = loc_res);
                        translate([100-4, -4, 0])
                        cylinder(d = 8, h = th, $fn = loc_res);

                    }
                }
            }
            // rounded edge cutout
            translate([152.5, 64/2, -1])
            difference() {
                translate([0, 0, -1.5])
                cylinder(d = 120, h = 5, $fn = 4*loc_res);
                translate([-52, -60, -2])
                cube([120, 120, 7]);
            }
            // M3 holes
            translate([-4, -4, -1])
            cylinder(d = 3, h = th+2, $fn = loc_res);
            translate([100-4, 64+4, -1])
            cylinder(d = 3, h = th+2, $fn = loc_res);
            translate([100-4, -4, -1])
            cylinder(d = 3, h = th+2, $fn = loc_res);
            translate([-4, 64+4, -1])
            cylinder(d = 3, h = th+2, $fn = loc_res);
        }
    }
}

module frame2(loc_res = 32, th = 6, th2 = 2) {
    color("lightBlue") {
        translate([0, 0, 0])
        difference() {
                union() {
                difference() {
                    hull() {
                        translate([-4, -4, 0])
                        cylinder(d = 8, h = th, $fn = loc_res);
                        translate([100-4, 64+4, 0])
                        cylinder(d = 8, h = th, $fn = loc_res);
                        translate([100-4, -4, 0])
                        cylinder(d = 8, h = th, $fn = loc_res);
                        translate([-4, 64+4, 0])
                        cylinder(d = 8, h = th, $fn = loc_res);
                    
                        translate([62.95, 64/2, 0])
                        difference() {
                            translate([0, 0, 0])
                            cylinder(d = 160, h = th, $fn = 4*loc_res);
                            translate([-70.5, -80, -1])
                            cube([160, 160, th+4]);
                        }
                    }
                    // rounded edge cutout
                    translate([152.5, 64/2, -1])
                    difference() {
                        translate([0, 0, -1.5])
                        cylinder(d = 120, h = th+5, $fn = 4*loc_res);
                        translate([-52, -60, -2])
                        cube([120, 120, th+5]);
                    }
                    // cut insert, so it gets hollow
                    union() {
                        translate([0, 0, -th2+1])
                        difference() {
                            hull() {
                                translate([-4, -4, 0])
                                cylinder(d = 6, h = th, $fn = loc_res);
                                translate([100-4, 64+4, 0])
                                cylinder(d = 6, h = th, $fn = loc_res);
                                translate([100-4, -4, 0])
                                cylinder(d = 6, h = th, $fn = loc_res);
                                translate([-4, 64+4, 0])
                                cylinder(d = 6, h = th, $fn = loc_res);
                            
                                translate([62.95, 64/2, 0])
                                difference() {
                                    translate([0, 0, 0])
                                    cylinder(d = 160-2, h = th, $fn = 4*loc_res);
                                    translate([-70.5, -80, -1])
                                    cube([160, 160, th+4]);
                                }
                            }
                            // rounded edge cutout
                            translate([152.5, 64/2, -1])
                            difference() {
                                translate([0, 0, -1.5])
                                cylinder(d = 120+2, h = th+5, $fn = 4*loc_res);
                                translate([-52, -60, -2])
                                cube([120, 120, th+5]);
                            }
                        }
                    }
                    // micro usb connector
                    translate([-20, 32-5, -1])
                    cube([10, 10, 6]);
                }
                // PLCC 2 x 9 mm dia holes, standoffs
                translate([-5, 0, th-th2]) {
                    translate([100*1/4, 64*1/4, 0])
                    cylinder(d = 9+4, h = th2, $fn = loc_res);
                    translate([100*3/4, 64*1/4, 0])
                    cylinder(d = 9+4, h = th2, $fn = loc_res);
                    translate([100*2/4, 64*2/4, 0])
                    cylinder(d = 9+4, h = th2, $fn = loc_res);
                    translate([100*1/4, 64*3/4, 0])
                    cylinder(d = 9+4, h = th2, $fn = loc_res);
                    translate([100*3/4, 64*3/4, 0])
                    cylinder(d = 9+4, h = th2, $fn = loc_res);
                }
                // 4.5 = M3 insert nut
                translate([-4, -4, 0])
                cylinder(d = 8, h = th, $fn = loc_res);
                translate([100-4, 64+4, 0])
                cylinder(d = 8, h = th, $fn = loc_res);
                translate([100-4, -4, 0])
                cylinder(d = 8, h = th, $fn = loc_res);
                translate([-4, 64+4, 0])
                cylinder(d = 8, h = th, $fn = loc_res);
            }
        
            // holes
            // 4.5 = M3 insert nut hole
            translate([-4, -4, -1])
            cylinder(d = 4.5, h = th+2, $fn = loc_res);
            translate([100-4, 64+4, -1])
            cylinder(d = 4.5, h = th+2, $fn = loc_res);
            translate([100-4, -4, -1])
            cylinder(d = 4.5, h = th+2, $fn = loc_res);
            translate([-4, 64+4, -1])
            cylinder(d = 4.5, h = th+2, $fn = loc_res);
            // PLCC 2 x 9 mm dia holes
            translate([-5, 0, 0]) {
                translate([100*1/4, 64*1/4, -1])
                cylinder(d = 9, h = th+2, $fn = loc_res);
                translate([100*3/4, 64*1/4, -1])
                cylinder(d = 9, h = th+2, $fn = loc_res);
                translate([100*2/4, 64*2/4, -1])
                cylinder(d = 9, h = th+2, $fn = loc_res);
                translate([100*1/4, 64*3/4, -1])
                cylinder(d = 9, h = th+2, $fn = loc_res);
                translate([100*3/4, 64*3/4, -1])
                cylinder(d = 9, h = th+2, $fn = loc_res);
            }
            // mount points
            translate([95, 32+31, 6-1.5])
            rotate([0, 90, 0])
            cylinder(d = 1, h = 10, $fn = loc_res);
            translate([95, 32-31, 6-1.5])
            rotate([0, 90, 0])
            cylinder(d = 1, h = 10, $fn = loc_res);
            translate([85, 32+50, 6-1.5])
            rotate([0, -90, 90])
            cylinder(d = 1, h = 100, $fn = loc_res);
            translate([5, 32+50, 6-1.5])
            rotate([0, -90, 90])
            cylinder(d = 1, h = 100, $fn = loc_res);
        }
    }
}

module frame3(loc_res = 32, th = 1) {
    color("LightGreen") {
        translate([0, 0, 0])
        difference() {
            hull() {
                translate([-4, -4, 0])
                cylinder(d = 8, h = th, $fn = loc_res);
                translate([100-4, 64+4, 0])
                cylinder(d = 8, h = th, $fn = loc_res);
                translate([100-4, -4, 0])
                cylinder(d = 8, h = th, $fn = loc_res);
                translate([-4, 64+4, 0])
                cylinder(d = 8, h = th, $fn = loc_res);
            
                translate([62.95, 64/2, 0])
                difference() {
                    translate([0, 0, 0])
                    cylinder(d = 160, h = th, $fn = 4*loc_res);
                    translate([-70.5, -80, -1])
                    cube([160, 160, 4]);
                }
            }
            // rounded edge cutout
            translate([152.5, 64/2, -1])
            difference() {
                translate([0, 0, -1.5])
                cylinder(d = 120, h = 5, $fn = 4*loc_res);
                translate([-52, -60, -2])
                cube([120, 120, 7]);
            }
            // 4.5 = M3 insert nut hole
            translate([-4, -4, -1])
            cylinder(d = 4.5, h = th+2, $fn = loc_res);
            translate([100-4, 64+4, -1])
            cylinder(d = 4.5, h = th+2, $fn = loc_res);
            translate([100-4, -4, -1])
            cylinder(d = 4.5, h = th+2, $fn = loc_res);
            translate([-4, 64+4, -1])
            cylinder(d = 4.5, h = th+2, $fn = loc_res);
            // 4.5 = M3 insert nut hole
            translate([-4, -4, -1])
            cylinder(d = 6, h = 1.2, $fn = loc_res);
            translate([100-4, 64+4, -1])
            cylinder(d = 6, h = 1.2, $fn = loc_res);
            translate([100-4, -4, -1])
            cylinder(d = 6, h = 1.2, $fn = loc_res);
            translate([-4, 64+4, -1])
            cylinder(d = 6, h = 1.2, $fn = loc_res);
            // label cutout
            translate([-10, 0, -0.8])
            hull() {
                translate([50-20, 32+10, 0])
                cylinder(d = 4, h = 1, $fn = loc_res);
                translate([50-20, 32-10, 0])
                cylinder(d = 4, h = 1, $fn = loc_res);
                translate([50+20, 32+10, 0])
                cylinder(d = 4, h = 1, $fn = loc_res);
                translate([50+20, 32-10, 0])
                cylinder(d = 4, h = 1, $fn = loc_res);
            }
        }
    }
}

//paper10x6cm();
*translate([0, 0, 6])
topCover();
*translate([0, 0, 2])
frame1();
*translate([0, 0, -2])
frame2();
translate([0, 0, -10])
frame3();