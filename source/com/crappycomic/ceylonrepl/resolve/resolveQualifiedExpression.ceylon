import ceylon.language.meta {
    classDeclaration
}
import ceylon.language.meta.declaration {
    FunctionDeclaration,
    FunctionOrValueDeclaration,
    ValueDeclaration
}

import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError,
    undefined
}
import com.crappycomic.ceylonrepl.evaluate {
    evaluate
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

shared BoundDeclaration|SyntaxError|Null resolveQualifiedExpression(
        Context context, Tree.QualifiedMemberExpression expression) {
    "TODO: Implement other operators"
    assert (expression.memberOperator is Tree.MemberOp);
    
    value receiver = evaluate(context, expression.primary);
    
    if (!exists receiver) {
        return receiver;
    } else if (is SyntaxError receiver) {
        return receiver;
    } else if (receiver == undefined) {
        return SyntaxError("Cannot dereference an undefined value");
    }
    
    value memberName = expression.identifier?.text;
    
    if (!exists memberName) {
        return SyntaxError("Unable to resolve qualified expression with empty identifier");
    }
    
    value clazz = classDeclaration(receiver);
    value member = clazz.getMemberDeclaration<FunctionOrValueDeclaration>(memberName);
    
    return switch (member)
        case (is FunctionDeclaration)
            MemberFunctionDeclaration(member, receiver)
        case (is ValueDeclaration)
            MemberValueDeclaration(member, receiver)
        case (null)
            SyntaxError("Type ``clazz`` does not have a function or value named ``memberName``");
}
