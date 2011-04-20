#include "structs.h"
#include "data.h"

void verbose_print(const char* message);

// there's an implicit dependency between this and the arguments
// struct. -DKL
void display_system(stellar_system* system, planet_pointer first_planet);
