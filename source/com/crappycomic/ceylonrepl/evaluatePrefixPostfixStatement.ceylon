import ceylon.ast.core {
    PrefixPostfixStatement
}

void evaluatePrefixPostfixStatement(Context context, PrefixPostfixStatement statement)
        => evaluate(context, statement.expression);
