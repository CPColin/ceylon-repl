import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError,
    Undefined
}
import com.crappycomic.ceylonrepl.resolve {
    BoundClassOrInterfaceDeclaration,
    BoundFunctionDeclaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

Anything evaluateInvocationExpression(Context context, Tree.InvocationExpression expression) {
    value resolved = evaluate(context, expression.primary);
    
    if (resolved is SyntaxError) {
        return resolved;
    } else if (resolved is Undefined) {
        return SyntaxError("Invocation target is undefined");
    }
    
    assert (is Tree.PositionalArgumentList arguments = expression.positionalArgumentList);
    
    value evaluatedArguments = {
        for (argument in arguments.positionalArguments)
            if (is Tree.ListedArgument argument) // TODO
                evaluate(context, argument.expression)
    };
    
    if (is BoundClassOrInterfaceDeclaration resolved) {
        return resolved.instantiate(*evaluatedArguments);
    } else if (is BoundFunctionDeclaration resolved) {
        return resolved.invoke(*evaluatedArguments);
    } else {
        return SyntaxError("Unable to invoke declaration: ``resolved else "<null>"``");
    }    
}
