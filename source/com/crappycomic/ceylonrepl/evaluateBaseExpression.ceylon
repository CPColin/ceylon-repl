import ceylon.ast.core {
    BaseExpression,
    MemberNameWithTypeArguments,
    Node
}

Anything evaluateBaseExpression(Context context, BaseExpression expression) {
    "TODO"
    assert (is MemberNameWithTypeArguments nameAndArgs = expression.nameAndArgs);
    "TODO"
    assert (!nameAndArgs.typeArguments exists);
    
    value identifier = nameAndArgs.name;
    value val = context[identifier.name];
    
    if (is Node val) {
        return evaluate(context, val);
    } else {
        return val;
    }
}
