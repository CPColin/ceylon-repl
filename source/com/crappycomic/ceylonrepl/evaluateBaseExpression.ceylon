import ceylon.ast.core {
    BaseExpression,
    Node
}

Anything evaluateBaseExpression(Context context, BaseExpression expression) {
    if (exists resolved = resolveBaseExpression(context, expression)) {
        value val = resolved.get();
        
        if (is Node val) {
            return evaluate(context, val);
        } else {
            return val;
        }
    } else {
        return null;
    }
}
