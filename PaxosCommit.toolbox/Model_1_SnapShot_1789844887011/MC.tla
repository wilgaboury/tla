---- MODULE MC ----
EXTENDS PaxosCommit, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
a1, a2, a3
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2
----

\* MV CONSTANT definitions Acceptor
const_178984486992677000 == 
{a1, a2, a3}
----

\* MV CONSTANT definitions RM
const_178984486992678000 == 
{r1, r2}
----

\* SYMMETRY definition
symm_178984486992679000 == 
Permutations(const_178984486992677000) \union Permutations(const_178984486992678000)
----

\* CONSTANT definitions @modelParameterConstants:0Ballot
const_178984486992680000 == 
{0, 1}
----

\* CONSTANT definitions @modelParameterConstants:2Majority
const_178984486992681000 == 
{{a1, a2}, {a1, a3}, {a2, a3}}
----

=============================================================================
\* Modification History
\* Created Sat Sep 19 15:07:49 EDT 2026 by wgabo
