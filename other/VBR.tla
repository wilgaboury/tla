-------------------------------- MODULE VBR --------------------------------

(***************************************************************************)
(* This is a specification of the viewstamped block replication protocol.  *)
(* The algorithm is designed specifically for implementing distributed     *)
(* block IO iterfaces.  Each block is treated independently, so operations *)
(* are not ordered across multiple blocks.                                 *)
(***************************************************************************)

EXTENDS Naturals, FiniteSets

CONSTANT B \* blocks
CONSTANT R \* replicas
CONSTANT C \* clients

VARIABLES
    replicaState,
    clientState,
    msgs

BlockState == [B -> [view: Nat, generation: Nat, value: Nat, storage: {"valid", "corrupt"}]]
ClientTable == [C -> Nat]
ReplicaState == [R -> [view: Nat, blockState: BlockState, clientTable: ClientTable]]
ClientState == [C -> Nat]

TypeOK ==
    /\ replicaState \in ReplicaState
    /\ msgs = {}

blockStateInit == [b \in B |-> [view |-> 0, generation |-> 0, value |-> 0, storage |-> "valid"]]

Init ==
    /\ replicaState = [r \in R |-> [view: 0, blockState: blockStateInit]]

CeilDiv(a, b) == IF a % b = 0 THEN a \div b ELSE (a \div b) + 1

CorruptSpecificBlock(r, b) == 
(***************************************************************************)
(* We make the simplifying assumption that for a given block there is at   *)
(* least one replica with a valid value.                                   *)
(***************************************************************************)
    /\ Cardinality({rr \in R \ {r} : rr.blockState[b].storage = "valid"}) > 1 \* TODO: need to add check for metadata validity
    /\ replicaState' = [replicaState EXCEPT !.blockState[b].storage = "corrupt"]
    /\ UNCHANGED <<clientState, msgs>>
    
CorruptBlock == \E r \in R, b \in B : CorruptSpecificBlock(r, b) 


=============================================================================
\* Modification History
\* Last modified Sun Sep 20 10:27:51 EDT 2026 by wgabo
\* Created Sat Sep 19 09:24:55 EDT 2026 by wgabo
