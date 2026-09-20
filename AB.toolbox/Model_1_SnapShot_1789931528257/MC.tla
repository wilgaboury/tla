---- MODULE MC ----
EXTENDS AB, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d1, d2, d3
----

\* MV CONSTANT definitions Data
const_178993152619936000 == 
{d1, d2, d3}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_178993152619937000 ==
/\ Len(AtoB) <= 3
/\ Len(BtoA) <= 3
----
=============================================================================
\* Modification History
\* Created Sun Sep 20 15:12:06 EDT 2026 by wgabo
