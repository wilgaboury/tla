---- MODULE MC ----
EXTENDS RemoveSeq, TLC

\* Constant expression definition @modelExpressionEval
const_expr_1789914000158109000 == 
(1..3) \X {"a", "b"}
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1789914000158109000>>)
----

=============================================================================
\* Modification History
\* Created Sun Sep 20 10:20:00 EDT 2026 by wgabo
