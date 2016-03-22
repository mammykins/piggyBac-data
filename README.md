# piggyBac-data
Supplementary information to a published paper, including data used in a meta-analysis of the literature and a comprehensive data set from a leading biotechnology company.

## Codebook
Codebook prepared by Matthew Gregory to compliment uploaded data as part of an attempt to make available data used in a paper accepted by the Journal of Insect Molecular Biology.  

Number of observations, number of variables.  
  
| Field label   | species       | size	| con	| helper and helper_id	| date	|
| ------------- |:-----------------------:|:--------------------:|:------------:|:---------------:|:------------------:|
| Variable     |insect species shorthand|  Size of piggyBac plasmid in base pairs	| Construct id	| Type of transposase used	| Relative chronology of injection for that engineer	|
| Variable type|factor|  numeric	| Random factor	| factor and random factor	| Ranked order	|
| Values       |aa, ae, dbm, pbw, tc, ds, mf, of|  
| Details       |Aedes aegypti, Aedes albopictus, Plutella xylostella, Pectinophora gossypiella, Tribolium castaneum, Drosophila suzuki, Ceratitis capitata, Bactrocera oleae|  
| Common name       |Yellow Fever Mosquito, Asian Tiger Mosquito, Diamondback moth, Pink bollworm, Spotted-wing Drosophila, MedFly, Olive Fly	|

The rest of the variables are numeric data desribing the outcome of the microinjections. There were inj injections conducted for that experimental unit, of which g0 survived to fertile adulthood, of which g0t showed transient expression, following crosses of the g0 there were X transgenic lines produced, with Xt transgenics originating from g0t, or Xnt, those lines that derived from non-transient g0. The derived variables surv = g0 / inj, g0.lambda = X / g0 and inj.lambda = X / inj.

For further details consult the associated journal paper.
  


