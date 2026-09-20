--------------------------- MODULE SimpleProgram ---------------------------

EXTENDS Integers
VARIABLES i, pc   

Init == (pc = "start") /\ (i = 0)

Pick == /\ pc = "start"  
        /\ i' \in 0..1000
        /\ pc' = "middle"

Add1 == /\ pc = "middle" 
        /\ i' = i + 1
        /\ pc' = "done"
           
Next == Pick \/ Add1

=============================================================================
\* Modification History
\* Last modified Thu Sep 17 20:28:05 EDT 2026 by wgabo
\* Created Thu Sep 17 20:23:52 EDT 2026 by wgabo
