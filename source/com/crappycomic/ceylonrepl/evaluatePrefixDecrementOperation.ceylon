import ceylon.ast.core {
    BaseExpression,
    MemberNameWithTypeArguments,
    PrefixDecrementOperation
}

Anything evaluatePrefixDecrementOperation(Context context, PrefixDecrementOperation operation) {
    value initial = evaluate(context, operation.operand);
    
    if (!exists initial) {
        return SyntaxError("Operand cannot be null");
    }
    
    value result = `value Ordinal.predecessor`.memberGet(initial);
    
    "TODO"
    assert (is BaseExpression baseExpression = operation.operand);
    "TODO"
    assert (is MemberNameWithTypeArguments memberName = baseExpression.nameAndArgs);
    
    context[memberName.name.name] = result;
    
    return result;
}
