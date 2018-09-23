import ceylon.ast.core {
    LazySpecifier,
    ValueDefinition
}

// TODO: Maybe return a specific "void" value?
Null evaluateValueDefinition(Context context, ValueDefinition definition) {
    value key = definition.name.name;
    value specifier = definition.definition;
    value expression = specifier.expression;
    value val = if (specifier is LazySpecifier) then expression else evaluate(context, expression);
    
    context[key] = val;
    
    return null;
}
