import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError,
    Undefined
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

// TODO: search current context, explicitly imported top-levels, ceylon.language top-levels

shared BoundDeclaration|SyntaxError|Undefined resolveBaseExpression(Context context,
        Tree.BaseMemberExpression expression) {
    value name = expression.identifier?.text;
    
    if (!exists name) {
        return SyntaxError("Unable to resolve empty identifier");
    }
    
    function recurse(Context context, String name) {
        if (context.defines(name)) {
            return ContextValueDeclaration(name, context);
        } else if (exists outerContext = context.outerContext) {
            return resolveBaseExpression(outerContext, expression);
        } else {
            return resolveTopLevel(`package ceylon.language`, name);
        }
    }
    
    return recurse(context, name);
}
