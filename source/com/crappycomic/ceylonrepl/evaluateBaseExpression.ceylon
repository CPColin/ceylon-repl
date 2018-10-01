import ceylon.ast.core {
    BaseExpression,
    Node
}

Anything evaluateBaseExpression(Context context, BaseExpression expression) {
    value resolved = resolveBaseExpression(context, expression);
    
    if (is BoundValueDeclaration resolved) {
        value val = resolved.get();
        
        if (is Node val) {
            return evaluate(context, val);
        } else {
            return val;
        }
    } else {
        return resolved;
    }
}
