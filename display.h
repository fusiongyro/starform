#include "structs.h"

void debug_print(char* message);
char *engineer_notation(double d, int p);
void chart_system(planet_pointer first_planet);
double local_bp(double bp_at_stp, double surf_pressure);
void text_list_stuff(double temp, double min_weight, double pressure, double orbital_radius, double escape_vel, double star_age);
void text_describe_planet(char *start, planet_pointer node1, int counter);
void text_describe_system(planet_pointer first_planet);
void lisp_describe_planet(char *opar, char *bstr, planet_pointer node1, int counter);
void lisp_describe_system(planet_pointer first_planet);
void display_system(planet_pointer first_planet);
