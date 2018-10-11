import ceylon.ast.core {
    MemberOperator,
    QualifiedExpression
}
import ceylon.language.meta {
    classDeclaration
}
import ceylon.language.meta.declaration {
    FunctionDeclaration,
    FunctionOrValueDeclaration,
    ValueDeclaration
}
import com.crappycomic.ceylonrepl.evaluate {
    evaluate
}

BoundDeclaration|SyntaxError|Null resolveQualifiedExpression(
        Context context, QualifiedExpression expression) {
    "TODO: Implement other operators"
    assert (expression.memberOperator is MemberOperator);
    "TODO"
    assert (!expression.nameAndArgs.typeArguments exists);
    
    value receiver = evaluate(context, nothing);
    
    if (!exists receiver) {
        return receiver;
    } else if (is SyntaxError receiver) {
        return receiver;
    }
    
    value memberName = expression.nameAndArgs.name.name;
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
