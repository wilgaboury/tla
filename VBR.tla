-------------------------------- MODULE VBR --------------------------------

(***************************************************************************)
(* This is a specification of the viewstamped block replication protocol.  *)
(* The algorithm is designed specifically for implementing distributed     *)
(* block IO iterfaces.  Each block is treated independently, so operations *)
(* are not ordered across multiple blocks.                                 *)
(***************************************************************************)

EXTENDS Naturals, FiniteSets

CONSTANT 
    NumBlocks,
    NumReplicas,
    ClientCmds,
    ViewChangeQuorum

ASSUME 
    /\ NumReplicas > 0
    /\ ViewChangeQuorum > 0
    /\ ViewChangeQuorum <= NumReplicas

B == 0..NumBlocks
R == 0..NumReplicas
NormalQuorum == 1 + NumReplicas - ViewChangeQuorum

VARIABLES
    replicaState,
    clientState,
    msgs
    
vars == << replicaState, clientState, msgs >>

BlockState == [B -> [view: Nat, generation: Nat, value: Nat, storage: {"valid", "corrupt"}]]
ReplicaStatus == {"view_change", "normal"}
ReplicaState == [R -> [view: Nat, status: ReplicaStatus, blockState: BlockState]]
Messages == [type: "Message"]

TypeOK ==
    /\ replicaState \in ReplicaState
    /\ msgs \in Messages

blockStateInit == [b \in B |-> [view |-> 0, generation |-> 0, value |-> 0, storage |-> "valid"]]
replicaStateInit == [r \in R |-> [view: 0, blockState: blockStateInit]]

Init ==
    /\ replicaState = replicaStateInit
    /\ msgs = {}

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

Next == 
    \/ CorruptBlock


=============================================================================
\* Modification History
\* Last modified Sun Sep 20 18:00:42 EDT 2026 by wgabo
\* Created Sat Sep 19 09:24:55 EDT 2026 by wgabo
