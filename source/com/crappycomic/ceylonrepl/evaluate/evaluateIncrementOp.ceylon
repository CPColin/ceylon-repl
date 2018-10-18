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
import com.crappycomic.ceylonrepl.resolve {
    resolveBaseExpression,
    BoundValueDeclaration
}

Anything evaluateIncrementOp(Context context, Tree.IncrementOp operation) {
    "TODO"
    assert (is Tree.BaseMemberExpression baseExpression = operation.term);
    
    value resolved = resolveBaseExpression(context, baseExpression);
    
    if (is SyntaxError resolved) {
        return resolved;
    } else if (resolved == undefined) {
        return SyntaxError("Operand is undefined");
    }
    
    // Couldn't do "!is BoundValueDeclaration resolved" because the compiler complained that the
    // resulting type contained unshared classes.
    if (!resolved is BoundValueDeclaration) {
        return SyntaxError("Operand is not a value");
    }
    
    assert (is BoundValueDeclaration resolved);
    
    value initial = resolved.get();
    
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
    
    resolved.set(result);
    
    return result;
}
