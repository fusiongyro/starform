#ifndef _ACCRETE_H
#define _ACCRETE_H

//#include "const.h"
#include "structs.h"
#include "utils.h"
#include "data.h"

accretion* make_accretion(
  double inner_limit_of_dust,
  double outer_limit_of_dust);

double stellar_dust_limit(double star_mass_r);

double nearest_planet(double star_mass_r);

double farthest_planet(double star_mass_r);

double inner_effect_limit(accretion* accretion, double a, double e, double mass);

double outer_effect_limit(accretion* accretion, double a, double e, double mass);

int  dust_available(accretion* accretion, double inside_range, double outside_range);

void update_dust_lanes(
  accretion* accretion,
  double min, double max, double mass, 
  double crit_mass, 
  double body_inner_bound, double body_outer_bound);

double collect_dust(
  accretion *accretion,
  double last_mass, double a, double e,
  double crit_mass, dust_pointer dust_band);
  
double critical_limit(
  double orb_radius, double eccentricity, double star_lum_r);
  
void accrete_dust(
  accretion *accretion,
  double *seed_mass, double a, double e, 
  double crit_mass, 
  double body_inner_bound, double body_outer_bound);

void coalesce_planetesimals(
  accretion *accretion,
  double a, double e, double mass, 
  double crit_mass, 
  double star_lum_r, 
  double body_inner_bound, double body_outer_bound);

planet_pointer dist_planetary_masses(
  double star_mass_r, 
  double star_lum_r, 
  double inner_dust, 
  double outer_dust);

planet_pointer do_dist_moon_masses(
  double planetary_mass, 
  double plan_radius);

#endif
