import ceylon.ast.core {
    ProductOperation
}

Anything evaluateProductOperation(Context context, ProductOperation operation) {
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
    
    return `function Numeric.times`.memberInvoke(left, [], right);
}
