import ceylon.ast.core {
    QualifiedExpression
}

Anything evaluateQualifiedExpression(Context context, QualifiedExpression expression)
        => switch (resolved = resolveQualifiedExpression(context, expression))
            case (is BoundValueDeclaration)
                resolved.get()
            else
                resolved;
