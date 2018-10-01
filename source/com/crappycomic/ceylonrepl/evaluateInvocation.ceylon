import ceylon.ast.core {
    Invocation,
    PositionalArguments
}

Anything evaluateInvocation(Context context, Invocation invocation) {
    value resolved = evaluate(context, invocation.invoked);
    
    if (resolved is SyntaxError) {
        return resolved;
    }
    
    value arguments = invocation.arguments;
    
    assert (is PositionalArguments arguments);
    
    value evaluatedArguments = {
        for (argument in arguments.argumentList.listedArguments)
            evaluate(context, argument)
    };
    
    if (is BoundClassOrInterfaceDeclaration resolved) {
        return resolved.instantiate(*evaluatedArguments);
    } else if (is BoundFunctionDeclaration resolved) {
        return resolved.invoke(*evaluatedArguments);
    } else {
        return SyntaxError("Unable to invoke declaration: ``resolved else "<null>"``");
    }
}
