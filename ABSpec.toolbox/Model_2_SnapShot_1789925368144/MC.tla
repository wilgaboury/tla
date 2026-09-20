---- MODULE MC ----
EXTENDS ABSpec, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d1, d2, d3
----

\* MV CONSTANT definitions Data
const_178992536606711000 == 
{d1, d2, d3}
----

\* PROPERTY definition @modelCorrectnessProperties:0
prop_178992536606713000 ==
\A v \in Data \X {0,1} : (AVar = v) ~> (BVar = v)
----
=============================================================================
\* Modification History
\* Created Sun Sep 20 13:29:26 EDT 2026 by wgabo
