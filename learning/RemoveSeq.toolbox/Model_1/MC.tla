---- MODULE MC ----
EXTENDS RemoveSeq, TLC

\* Constant expression definition @modelExpressionEval
const_expr_1789914014944111000 == 
1..3 \X {"a", "b"}
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1789914014944111000>>)
----

=============================================================================
\* Modification History
\* Created Sun Sep 20 10:20:14 EDT 2026 by wgabo
