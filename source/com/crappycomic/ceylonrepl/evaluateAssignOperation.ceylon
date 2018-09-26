import ceylon.ast.core {
    AssignOperation,
    BaseExpression,
    MemberNameWithTypeArguments
}

Anything evaluateAssignOperation(Context context, AssignOperation operation) {
    value result = evaluate(context, operation.expression);
    
    "TODO"
    assert (is BaseExpression baseExpression = operation.target);
    "TODO"
    assert (is MemberNameWithTypeArguments memberName = baseExpression.nameAndArgs);
    
    context[memberName.name.name] = result;
    
    return result;
}
