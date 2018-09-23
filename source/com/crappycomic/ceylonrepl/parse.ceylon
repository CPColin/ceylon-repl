import ceylon.ast.core {
    Node
}
import ceylon.ast.redhat {
    ...
}

shared Node? parse(String code)
        => // parseBlock(code) else
         parseValueDeclaration(code)
                else parseExpression(code)
                else parseStatement(code)
                else parseDeclaration(code)
                else parseAnyCompilationUnit(code);
