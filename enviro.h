#include "data.h"

double luminosity(double mass_ratio);
int  orb_zone(stellar_system* system, double orb_radius);
double volume_radius(double mass, double density);
double kothari_radius(double mass, int giant, int zone);
double empirical_density(stellar_system* system, double mass, double orb_radius, int gas_giant);
double volume_density(double mass, double equat_radius);
double period(double separation, double small_mass, double large_mass);
double day_length(stellar_system* system, double mass, double radius, double eccentricity, double density, double orb_radius, double orb_period, int giant, double mass_ratio);
int  inclination(double orb_radius);
double escape_vel(double mass, double radius);
double rms_vel(stellar_system* system, double molecular_weight, double orb_radius);
double molecule_limit(double mass, double equat_radius);
double acceleration(double mass, double radius);
double gravity(double acceleration);
int  grnhouse(int zone, double orb_radius, double r_greenhouse);
double vol_inventory(double mass, double escape_vel, double rms_vel, double stellar_mass, int zone, int greenhouse_effect);
double pressure(double volatile_gas_inventory, double equat_radius, double gravity);
double boiling_point(double surf_pressure);
void iterate_surface_temp(stellar_system* system, planet_pointer* planet);
void iterate_surface_temp_moon(stellar_system* system, planet_pointer* primary, planet_pointer * planet);
