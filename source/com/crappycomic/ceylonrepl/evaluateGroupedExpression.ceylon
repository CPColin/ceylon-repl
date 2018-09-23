import ceylon.ast.core {
    GroupedExpression
}

Anything evaluateGroupedExpression(Context context, GroupedExpression expression) {
    return evaluate(context, expression.innerExpression);
}
