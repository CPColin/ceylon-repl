import ceylon.language.meta.declaration {
    FunctionDeclaration,
    FunctionOrValueDeclaration,
    Package,
    ValueDeclaration
}

BoundDeclaration? resolveTopLevel(Package packaje, String name) {
    value member = packaje.getMember<FunctionOrValueDeclaration>(name);
    
    if (is FunctionDeclaration member) {
        return TopLevelFunctionDeclaration(member);
    } else if (is ValueDeclaration member) {
        return TopLevelValueDeclaration(member);
    } else {
        return null;
    }
}
