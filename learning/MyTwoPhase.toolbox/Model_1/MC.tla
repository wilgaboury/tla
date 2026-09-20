---- MODULE MC ----
EXTENDS MyTwoPhase, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions RM
const_178983284014556000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_178983284014557000 == 
Permutations(const_178983284014556000)
----

=============================================================================
\* Modification History
\* Created Sat Sep 19 11:47:20 EDT 2026 by wgabo
