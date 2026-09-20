---- MODULE MC ----
EXTENDS RemoveSeq, TLC

\* Constant expression definition @modelExpressionEval
const_expr_1789913856940105000 == 
Remove(3, <<1, 2, 3, 4>>)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1789913856940105000>>)
----

=============================================================================
\* Modification History
\* Created Sun Sep 20 10:17:36 EDT 2026 by wgabo
