import ceylon.language.meta.declaration {
    ClassOrInterfaceDeclaration,
    FunctionDeclaration,
    Package,
    ValueDeclaration
}

BoundDeclaration? resolveTopLevel(Package packaje, String name) {
    if (exists member = packaje.getMember<ValueDeclaration>(name)) {
        // Top-level objects match both ClassOrInterfaceDeclaration and ValueDeclaration.
        return TopLevelValueDeclaration(member);
    } else if (exists member = packaje.getMember<FunctionDeclaration>(name)) {
        return TopLevelFunctionDeclaration(member);
    } else if (exists member = packaje.getMember<ClassOrInterfaceDeclaration>(name)) {
        return TopLevelClassOrInterfaceDeclaration(member);
    } else {
        return null;
    }
}
