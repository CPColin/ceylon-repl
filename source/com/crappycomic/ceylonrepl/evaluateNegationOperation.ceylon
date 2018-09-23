import ceylon.ast.core {
    NegationOperation
}

Anything|SyntaxError evaluateNegationOperation(Context context, NegationOperation operation) {
    value operand = evaluate(context, operation.operand);
    
    if (is SyntaxError operand) {
        return operand;
    } else if (is Invertible<in Nothing> operand) {
        return operand.negated;
    } else {
        return SyntaxError("Operand cannot be negated");
    }
}
