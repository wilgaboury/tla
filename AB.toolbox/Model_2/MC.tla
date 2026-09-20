---- MODULE MC ----
EXTENDS AB, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d1, d2, d3
----

\* MV CONSTANT definitions Data
const_178993247126875000 == 
{d1, d2, d3}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_178993247126876000 ==
/\ Len(AtoB) <= 3
/\ Len(BtoA) <= 3
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_178993247126878000 ==
ABS!FairSpec
----
=============================================================================
\* Modification History
\* Created Sun Sep 20 15:27:51 EDT 2026 by wgabo
