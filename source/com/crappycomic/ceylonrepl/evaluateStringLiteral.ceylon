import ceylon.ast.core {
    StringLiteral
}

String|SyntaxError evaluateStringLiteral(Context context, StringLiteral literal) {
    return literal.text;
}
