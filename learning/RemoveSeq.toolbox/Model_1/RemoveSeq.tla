----------------------------- MODULE RemoveSeq -----------------------------

EXTENDS Integers, Sequences

Remove(i, seq) ==
    [j \in 1..(Len(seq)-1) |-> IF j < i THEN seq[j] ELSE seq[j +1]]

=============================================================================
\* Modification History
\* Last modified Sun Sep 20 10:16:57 EDT 2026 by wgabo
\* Created Sun Sep 20 10:15:47 EDT 2026 by wgabo
