---- MODULE MC ----
EXTENDS TwoPhase, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions RM
const_1789853194345101000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1789853194345102000 == 
Permutations(const_1789853194345101000)
----

=============================================================================
\* Modification History
\* Created Sat Sep 19 17:26:34 EDT 2026 by wgabo
