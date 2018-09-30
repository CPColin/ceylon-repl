import ceylon.language.meta.declaration {
    FunctionDeclaration,
    ValueDeclaration
}
import ceylon.language.meta.model {
    Type
}

interface BoundDeclaration
        of BoundFunctionDeclaration
            | BoundValueDeclaration {}

interface BoundFunctionDeclaration
        of MemberFunctionDeclaration
            | TopLevelFunctionDeclaration
        satisfies BoundDeclaration {
    shared formal Anything invoke(Anything* arguments);
}

interface BoundValueDeclaration
        of ContextValueDeclaration
            | MemberValueDeclaration
            | StaticValueDeclaration
            | TopLevelValueDeclaration
        satisfies BoundDeclaration {
    shared formal Anything get();
    
    shared formal void set(Anything newValue);
}

class ContextValueDeclaration(String name, Context context) satisfies BoundValueDeclaration {
    get() => context.get(name);
    
    set(Anything newValue) => context.put(name, newValue);
}

class MemberFunctionDeclaration(FunctionDeclaration declaration, Object container)
        satisfies BoundFunctionDeclaration {
    invoke(Anything* arguments) => declaration.memberInvoke(container, empty, *arguments);
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

class TopLevelFunctionDeclaration(FunctionDeclaration declaration)
        satisfies BoundFunctionDeclaration {
    invoke(Anything* arguments) => declaration.invoke(empty, *arguments);
}

class TopLevelValueDeclaration(ValueDeclaration declaration)
        satisfies BoundValueDeclaration {
    get() => declaration.get();
    
    set(Anything newValue) => declaration.set(newValue);
}
