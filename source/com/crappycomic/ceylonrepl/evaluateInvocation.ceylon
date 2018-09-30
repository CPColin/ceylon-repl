import ceylon.ast.core {
    Invocation,
    PositionalArguments
}

Anything evaluateInvocation(Context context, Invocation invocation) {
    value resolved = evaluate(context, invocation.invoked);
    
    assert (is BoundFunctionDeclaration resolved);
    
    value arguments = invocation.arguments;
    
    assert (is PositionalArguments arguments);
    
    value evaluatedArguments = {
        for (argument in arguments.argumentList.listedArguments)
            evaluate(context, argument)
    };
    
    return resolved.invoke(*evaluatedArguments);
}
