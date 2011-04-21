
#include <stdlib.h>
#include <string.h>

#include "propert.h"

static int cmpWeight(const void *ap, const void *bp)
{
  const element *a = *(element**) ap;
  const element *b = *(element**) bp;

  if (a->weight > b->weight)
    return +1;

  return a->weight < b->weight ? -1 : 0;
}

static int cmpMelt(const void *ap, const void *bp)
{
  const element *a = *(element **) ap;
  const element *b = *(element **) bp;

  if (a->melt > b->melt)
    return +1;

  return a->melt < b->melt ? -1 : 0;
}

static int cmpBoil(const void *ap, const void *bp)
{
  const element *a = *(element **) ap;
  const element *b = *(element **) bp;

  if (a->boil > b->boil)
    return +1;

  return a->boil < b->boil ? -1 : 0;
}

static int cmpAbundS(const void *ap, const void *bp)
{
  const element *a = *(element **) ap;
  const element *b = *(element **) bp;
  double      aa = a->abunds * a->abunde;
  double      bb = b->abunds * b->abunde;

  if (aa > bb)
    return +1;

  return aa < bb ? -1 : 0;
}

static element* findSymbol(const char *sym)
{
  element   *p;

  for (p = elements; p->num; p++)
    if (strcmp(sym, p->symbol) == 0)
      return p;

  return NULL;
}

int propMakeVector(char *str, element ** vec, int max)
{
  char       *list = (char*)malloc(strlen(str) + 1);
  char       *p;
  int         num = 0;

  if (!list)
    return -1;

  if (!vec)
    return 0;

  strcpy(list, str);

  for (p = strtok(list, " "); num < max && p; p = strtok(NULL, " "))
  {
    vec[num] = findSymbol(p);

    if (vec[num])
      num++;
  }

  free(list);
  return num;
}

static char* propSort(char *list, int fn(const void *, const void *))
{
  element  **vec = (element**)malloc(strlen(list) * sizeof(element *));
  int         num = propMakeVector(list, vec, strlen(list));

  if (num)
  {
    int         i;

    strcpy(list, "");
    qsort(vec, num, sizeof(*vec), fn);

    for (i = 0; i < num; i++)
    {
      if (i)
	      strcat(list, " ");

      strcat(list, vec[i]->symbol);
    }
  }

  free(vec);
  return list;
}

char* propSortReverse(char *list)
{
  element **vec = (element**)malloc(strlen(list) * sizeof(element *));
  int        num = propMakeVector(list, vec, strlen(list));

  if (num)
  {
    int i;

    strcpy(list, "");
    for (i = num - 1; i >= 0; i--)
    {
      if (list[0])
	strcat(list, " ");
      strcat(list, vec[i]->symbol);
    }
  }
  free(vec);
  return list;
}

char* propSortByWeight(char *list)
{
  return propSort(list, cmpWeight);
}

char* propSortByMelt(char *list)
{
  return propSort(list, cmpMelt);
}

char* propSortByBoil(char *list)
{
  return propSort(list, cmpBoil);
}

char* propSortByAbundance(char *list)
{
  return propSort(list, cmpAbundS);
}

char* propFindGasAtTemp(char *out, double temp)
{
  element* p = elements;

  strcpy(out, "");
  for (; p->num > 0; p++)
  {
    if (p->boil >= 0 && p->boil < temp)
    {
      if (*out)
	strcat(out, " ");
      strcat(out, p->symbol);
    }
  }
  return out;
}

char* find_liquid_elements_at_temp(char *out, double temp)
{
  element* p = elements;

  strcpy(out, "");
  for (; p->num > 0; p++)
  {
    if (p->melt >= 0 && p->melt < temp)
    {
      if (p->boil >= 0 && p->boil > temp)
      {
	if (*out)
	  strcat(out, " ");
	strcat(out, p->symbol);
      }
    }
  }
  return out;
}

char* propFindSolidAtTemp(char *out, double temp)
{
  element* p = elements;

  strcpy(out, "");
  for (; p->num > 0; p++)
  {
    if (p->melt > 0 && p->melt > temp)
    {
      if (*out)
	strcat(out, " ");
      strcat(out, p->symbol);
    }
  }
  return out;
}

element elements[] =
{
#include "elements.dat"
/* An   sym    name             Aw  melt    boil    dens   ABUNDe ABUNDs Rea */
  {900, "NH3", "Ammonia",       17, 195.46, 239.66, 0.001, 0.002, 0.001, 0.001},
  {901, "H2O", "Water",         18, 273.16, 373.16, 1.000, 0.03,  0.001, 0},
  {902, "CO2", "CarbonDioxide", 44, 194.66, 194.66, 0.001, 0.01,  0.001, 0},
  {903, "O3",  "Ozone",         48,  80.16, 161.16, 0.001, 0.001, 0.001, 0.001},
  {904, "CH4", "Methane",       16,  90.16, 109.16, 0.010, 0.005, 0.001, 0},
  {905, "CH3CH2OH", "Ethanol",  46, 159.06, 351.66, 0.895, 0.001, 0.001, 0},
  {999, "", "", 0, -1, -1, 0, 0, 0, 0},
  {0, "", "", 0, 0, 0, 0, 0, 0, 0}
};
