import ceylon.ast.core {
    BaseExpression,
    MemberNameWithTypeArguments,
    PrefixIncrementOperation
}

// TODO: Might as well create a node that says "lhs = lhs.successor" and evaluate it!
Anything evaluatePrefixIncrementOperation(Context context, PrefixIncrementOperation operation) {
    value initial = evaluate(context, operation.operand);
    
    if (!exists initial) {
        return SyntaxError("Operand cannot be null");
    }
    
    value result = `value Ordinal.successor`.memberGet(initial);
    
    "TODO"
    assert (is BaseExpression baseExpression = operation.operand);
    "TODO"
    assert (is MemberNameWithTypeArguments memberName = baseExpression.nameAndArgs);
    
    context[memberName.name.name] = result;
    
    return result;
}
