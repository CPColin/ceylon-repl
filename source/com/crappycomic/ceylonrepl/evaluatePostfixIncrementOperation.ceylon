import ceylon.ast.core {
    PostfixIncrementOperation,
    BaseExpression,
    MemberNameWithTypeArguments
}

// TODO: Might as well create a node that says "lhs = lhs.successor" and evaluate it!
Anything evaluatePostfixIncrementOperation(Context context, PostfixIncrementOperation operation) {
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
    
    return initial;
}
