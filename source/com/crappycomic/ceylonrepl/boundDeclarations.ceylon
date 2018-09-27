import ceylon.language.meta.declaration {
    ValueDeclaration
}
import ceylon.language.meta.model {
    Type
}

interface BoundValueDeclaration
        of MemberValueDeclaration|StaticValueDeclaration|TopLevelValueDeclaration {
    shared formal Anything get();
    
    shared formal void set(Anything newValue);
}

class MemberValueDeclaration(ValueDeclaration declaration, Object container)
        satisfies BoundValueDeclaration {
    get() => declaration.memberGet(container);
    
    set(Anything newValue) => declaration.memberSet(container, newValue);
}

class StaticValueDeclaration(ValueDeclaration declaration, Type<Object> containerType)
        satisfies BoundValueDeclaration {
    get() => declaration.staticGet(containerType);
    
    shared actual void set(Anything newValue) {
        throw Exception("ValueDeclaration.staticSet does not exist");
    }
}

class TopLevelValueDeclaration(ValueDeclaration declaration)
        satisfies BoundValueDeclaration {
    get() => declaration.get();
    
    set(Anything newValue) => declaration.set(newValue);
}
