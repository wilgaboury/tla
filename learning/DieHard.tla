------------------------------ MODULE DieHard ------------------------------

EXTENDS Integers

VARIABLES small, big

TypeOK == /\ small \in 0..3
          /\ big \in 0..5

Init == /\ small = 0 
        /\ big = 0
        
FillSmall == /\ small' = 3
             /\ big' = big
             
FillBig == /\ small' = small
           /\ big' = 5
           
EmptySmall == /\ small' = 0
             /\ big' = big
             
EmptyBig == /\ small' = small
            /\ big' = 0

SmallToBig == IF big + small <= 5
                THEN /\ big' = big + small
                     /\ small' = 0
                ELSE /\ big' = 5
                     /\ small' = small - (5 - big)
                     
BigToSmall == IF big + small <= 3
                THEN /\ big' = 0
                     /\ small' = big + small
                ELSE /\ big' = big - (3 - small)
                     /\ small' = 3

Next == \/ FillSmall
        \/ FillBig
        \/ EmptySmall
        \/ EmptyBig
        \/ SmallToBig
        \/ BigToSmall

=============================================================================
\* Modification History
\* Last modified Sat Sep 19 10:32:09 EDT 2026 by wgabo
\* Created Thu Sep 17 20:43:44 EDT 2026 by wgabo
