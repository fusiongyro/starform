#ifndef _ACCRETE_H
#define _ACCRETE_H

#include "structs.h"
#include "utils.h"
#include "data.h"

extern flags args;

// If these are our entry points, they should probably look more like
// entry points than random functions. -DKL

double stellar_dust_limit(double star_mass_r);

planet_pointer dist_planetary_masses(
  double star_mass_r, 
  double star_lum_r, 
  double inner_dust, 
  double outer_dust);

planet_pointer do_dist_moon_masses(
  double planetary_mass, 
  double plan_radius);

#endif
