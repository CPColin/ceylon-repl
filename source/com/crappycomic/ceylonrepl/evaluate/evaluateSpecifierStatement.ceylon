import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError,
    Undefined,
    undefined
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

Undefined|SyntaxError evaluateSpecifierStatement(Context context,
        Tree.SpecifierStatement statement) {
    value identifier = statement.baseMemberExpression?.token?.text;
    
    if (!exists identifier) {
        return SyntaxError("Cannot declare an attribute with no identifier");
    }
    
    value result = evaluate(context, statement.specifierExpression);
    
    if (is Undefined result) {
        return SyntaxError("Cannot store ``result`` into current context");
    } else if (is SyntaxError result) {
        return result;
    }
    
    variable value targetContext = context;
    
    // Figure out if the identifier is defined already.
    while (true) {
        if (targetContext.defines(identifier)) {
            // It's defined at this level! Found our target!
            break;
        } else if (exists outerContext = targetContext.outerContext) {
            // It's not defined at this level, but there's an outer context to check.
            targetContext = outerContext;
        } else {
            // We have no more contexts to check, so define it in the original context.
            targetContext = context;
            break;
        }
    }
    
    targetContext[identifier] = result;
    
    return undefined;
}
