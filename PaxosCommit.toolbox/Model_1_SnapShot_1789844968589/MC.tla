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
const_178984496251191000 == 
{a1, a2, a3}
----

\* MV CONSTANT definitions RM
const_178984496251192000 == 
{r1, r2}
----

\* SYMMETRY definition
symm_178984496251193000 == 
Permutations(const_178984496251192000)
----

\* CONSTANT definitions @modelParameterConstants:0Ballot
const_178984496251194000 == 
{0, 1}
----

\* CONSTANT definitions @modelParameterConstants:2Majority
const_178984496251195000 == 
{{a1, a2}, {a1, a3}, {a3}}
----

=============================================================================
\* Modification History
\* Created Sat Sep 19 15:09:22 EDT 2026 by wgabo
