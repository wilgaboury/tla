---- MODULE MC ----
EXTENDS AB, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d1, d2, d3
----

\* MV CONSTANT definitions Data
const_178993223949571000 == 
{d1, d2, d3}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_178993223949572000 ==
/\ Len(AtoB) <= 3
/\ Len(BtoA) <= 3
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_178993223949574000 ==
ABS!FairSpec
----
=============================================================================
\* Modification History
\* Created Sun Sep 20 15:23:59 EDT 2026 by wgabo
