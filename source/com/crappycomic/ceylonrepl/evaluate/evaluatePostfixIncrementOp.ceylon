import ceylon.language.meta.model {
    IncompatibleTypeException
}

import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError,
    undefined
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

Anything evaluatePostfixIncrementOp(Context context, Tree.PostfixIncrementOp operation) {
    value initial = evaluate(context, operation.term);
    
    if (!exists initial) {
        return SyntaxError("Operand cannot be null");
    } else if (initial == undefined) {
        return SyntaxError("Operand is undefined");
    }
    
    Anything result;
    
    try {
        result = `value Ordinal.successor`.memberGet(initial);
    } catch (IncompatibleTypeException e) {
        return SyntaxError("Incompatible types: ``e.string``");
    }
    
    "TODO"
    assert (is Tree.BaseMemberExpression baseExpression = operation.term);
    
    value identifier = baseExpression.identifier?.text;
    
    if (!exists identifier) {
        return SyntaxError("Cannot increment empty identifier");
    }
    
    context[identifier] = result;
    
    return initial;
}
