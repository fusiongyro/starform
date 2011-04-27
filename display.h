#include "structs.h"
#include "gensys.h"

void verbose_print(const char* message);

// there's an implicit dependency between this and the arguments
// struct. -DKL
void display_system(stellar_system* system, planet* first_planet);
