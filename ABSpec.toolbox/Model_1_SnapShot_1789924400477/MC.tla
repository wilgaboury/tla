---- MODULE MC ----
EXTENDS ABSpec, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d1, d2, d3
----

\* MV CONSTANT definitions Data
const_17899243951515000 == 
{d1, d2, d3}
----

\* SYMMETRY definition
symm_17899243951516000 == 
Permutations(const_17899243951515000)
----

=============================================================================
\* Modification History
\* Created Sun Sep 20 13:13:15 EDT 2026 by wgabo
