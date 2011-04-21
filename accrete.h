#ifndef _ACCRETE_H
#define _ACCRETE_H

#include "structs.h"
#include "utils.h"
#include "data.h"

extern flags args;

typedef struct dust_record
{
  double      inner_edge;
  double      outer_edge;
  int         dust_present;
  int         gas_present;
  dust_pointer next_band;
} dust;

typedef struct
{
  /* A few variables global to the entire program:                */
  planet_pointer planet_head;
  
  /* Now for some variables global to the accretion process:      */
  int         dust_left;
  double      r_inner;
  double      r_outer;
  double      reduced_mass;
  double      dust_density;
  double      cloud_eccen;
  dust_pointer dust_head;  
} accretion;


// If these are our entry points, they should probably look more like
// entry points than random functions. -DKL

double stellar_dust_limit(double star_mass_r);

planet_pointer dist_planetary_masses(
  stellar_system* system,
  double inner_dust, 
  double outer_dust);

planet_pointer do_dist_moon_masses(
  double planetary_mass, 
  double plan_radius);

#endif
