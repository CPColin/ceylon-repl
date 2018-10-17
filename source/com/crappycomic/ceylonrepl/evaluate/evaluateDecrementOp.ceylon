import ceylon.language.meta.model {
    IncompatibleTypeException
}

import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError,
    undefined
}
import com.crappycomic.ceylonrepl.resolve {
    BoundValueDeclaration,
    resolveBaseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

Anything evaluateDecrementOp(Context context, Tree.DecrementOp operation) {
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
        result = `value Ordinal.predecessor`.memberGet(initial);
    } catch (IncompatibleTypeException e) {
        return SyntaxError("Incompatible types: ``e.string``");
    }
    
    value identifier = baseExpression.identifier?.text;
    
    if (!exists identifier) {
        return SyntaxError("Cannot decrement empty identifier");
    }
    
    resolved.set(result);
    
    return result;
}
