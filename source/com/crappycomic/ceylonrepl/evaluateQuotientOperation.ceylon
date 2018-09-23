import ceylon.ast.core {
    QuotientOperation
}

Anything evaluateQuotientOperation(Context context, QuotientOperation operation) {
    value left = evaluate(context, operation.leftOperand);
    
    if (is SyntaxError left) {
        return left;
    }
    
    if (!exists left) {
        return SyntaxError("Left operand cannot be null");
    }
    
    value right = evaluate(context, operation.rightOperand);
    
    if (is SyntaxError right) {
        return right;
    }
    
    return `function Numeric.divided`.memberInvoke(left, [], right);
}
