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
    ViewChangeQuorum,
    MaxViewChanges

ASSUME 
    /\ NumReplicas > 0
    /\ ViewChangeQuorum > 0
    /\ ViewChangeQuorum <= NumReplicas

B == 0..NumBlocks
R == 0..NumReplicas
NormalQuorum == 1 + NumReplicas - ViewChangeQuorum
Val == 0..NumReplicas

VARIABLES
    replicaState,
    msgs,
    viewChanges
    
vars == << replicaState, msgs, viewChanges >>

BlockState == [B -> [gen: Nat, value: Val, storage: {"valid", "corrupt"}]]
ReplicaStatus == {"normal", "start_view_change", "do_view_change"}
ReplicaState == [R -> [view: Nat, status: ReplicaStatus, blockState: BlockState]]
Messages == SUBSET (UNION {[
        type: {"START-VIEW-CHANGE"},
        source: R,
        view: Nat
    ],[
        type: {"RECOVER"},
        source: R,
        block: B
    ], [
        type: {"RECOVER-OK"},
        source: R,
        dst: R,
        view: Nat,
        gen: Nat,
        value: Val
    ]})

TypeOK ==
    /\ replicaState \in ReplicaState
    /\ msgs \in Messages

blockStateInit == [b \in B |-> [generation |-> 0, value |-> 0, storage |-> "valid"]]
replicaStateInit == [r \in R |-> [view |-> 0, status |-> "normal", blockState |-> blockStateInit]]

Init ==
    /\ replicaState = replicaStateInit
    /\ msgs = {}
    /\ viewChanges = 0

CeilDiv(a, b) == IF a % b = 0 THEN a \div b ELSE (a \div b) + 1

CorruptSpecificBlock(r, b) == 
(***************************************************************************)
(* We make the simplifying assumption that for a given block there is at   *)
(* least one replica with a valid value.                                   *)
(***************************************************************************)
    /\ Cardinality({rr \in R \ {r} : rr.blockState[b].storage = "valid"}) > 1 \* TODO: need to make sure we are not corrupting all max gen blocks
    /\ replicaState' = [replicaState EXCEPT !.blockState[b].storage = "corrupt"]
    /\ UNCHANGED << msgs, viewChanges >>
    
CorruptBlock == \E r \in R, b \in B : CorruptSpecificBlock(r, b)

SendBlockRecover(r, b) ==
    /\ replicaState[r].blockState[b].storage = "corrupt"
    /\ msgs' = msgs \union {[ type |-> "RECOVER", source |-> r, block |-> b ]}
    /\ UNCHANGED << replicaState, viewChanges >>

StartBlockRecover == \E r \in R, b \in B : SendBlockRecover(r, b)

SendBlockRecoverOk(r, b) ==
    /\ replicaState[r].blockState[b] = "valid"
    /\ \E rr \in R : 
        /\ [type |-> "RECOVER", source |-> rr, block |-> b] \in msgs
        /\ msgs' = msgs \union {[ 
            type |-> "RECOVER-OK", 
            source |-> r, 
            dst |-> rr,
            view |-> replicaState[r].view,
            gen |-> replicaState[r].blockState[b].gen,
            value |-> replicaState[r].blockState[b].value]}
        /\ UNCHANGED << replicaState >>

StartBlockRecoverOk == \E r \in R, b \in B : SendBlockRecoverOk(r, b)

StartViewChange ==
    /\ viewChanges < MaxViewChanges
    /\ \E r \in R :
        /\ replicaState' = [ replicaState EXCEPT !.status = "start-view-change" ]       
        /\ msgs' = msgs \union {[ type |-> "START-VIEW-CHANGE", source |-> r, view |-> replicaState[r].view ]}
        /\ UNCHANGED << viewChanges >>

Next == 
    \/ CorruptBlock
    \/ StartViewChange


=============================================================================
\* Modification History
\* Last modified Mon Sep 21 23:33:56 EDT 2026 by wgabo
\* Created Sat Sep 19 09:24:55 EDT 2026 by wgabo
