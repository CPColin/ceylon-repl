import ceylon.ast.core {
    IntegerLiteral
}

suppressWarnings("deprecation")
Integer|SyntaxError evaluateIntegerLiteral(Context context, IntegerLiteral literal) {
    value stripped = literal.text.replace("_", "");
    String val;
    Integer radix;
    
    if (stripped.startsWith("$")) {
        val = stripped[1...];
        radix = 2;
    } else if (stripped.startsWith("#")) {
        val = stripped[1...];
        radix = 16;
    } else {
        val = stripped;
        radix = 10;
    }
    
    return parseInteger(val, radix) else SyntaxError("Unable to parse Integer literal");
}
