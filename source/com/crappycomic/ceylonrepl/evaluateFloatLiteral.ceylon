import ceylon.ast.core {
    FloatLiteral
}

suppressWarnings("deprecation")
Float|SyntaxError evaluateFloatLiteral(Context context, FloatLiteral literal) {
    value stripped = literal.text.replace("_", "");
    
    return parseFloat(stripped) else SyntaxError("Unable to parse Float literal");
}
