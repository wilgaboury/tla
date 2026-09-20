---- MODULE MC ----
EXTENDS MyTwoPhase, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions RM
const_178983260569449000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_178983260569450000 == 
Permutations(const_178983260569449000)
----

=============================================================================
\* Modification History
\* Created Sat Sep 19 11:43:25 EDT 2026 by wgabo
