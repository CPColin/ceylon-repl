import ceylon.ast.core {
    BaseExpression
}

// TODO: search current context, explicitly imported top-levels, ceylon.language top-levels
// will likely need a BoundValueDeclaration that encapsulates the Context the value is in

ContextValueDeclaration? resolveBaseExpression(Context context, BaseExpression expression) {
    value name = expression.nameAndArgs.name.name;
    
    "TODO" assert (!expression.nameAndArgs.typeArguments exists);
    
    function recurse(Context context, String name) {
        if (context.defines(name)) {
            return ContextValueDeclaration(name, context);
        } else if (exists outerContext = context.outerContext) {
            return resolveBaseExpression(outerContext, expression);
        } else {
            return null;
        }
    }
    
    return recurse(context, name);
}
