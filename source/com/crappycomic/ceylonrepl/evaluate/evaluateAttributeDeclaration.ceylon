import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError,
    Undefined,
    undefined
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

Undefined|SyntaxError evaluateAttributeDeclaration(Context context,
        Tree.AttributeDeclaration declaration) {
    value identifier = declaration.identifier?.token?.text;
    
    if (!exists identifier) {
        return SyntaxError("Cannot declare an attribute with no identifier");
    }
    
    if (context.defines(identifier)) {
        return SyntaxError("Identifier ``identifier`` is already defined in the current context");
    }
    
    if (is Tree.Expression expression = declaration.specifierOrInitializerExpression?.expression) {
        value result = evaluate(context, expression);
        
        if (is Undefined result) {
            SyntaxError("Cannot store ``result`` into current context");
        } else if (is SyntaxError result) {
            return result;
        } else {
            context[identifier] = result;
        }
    }
    
    return undefined;
}
