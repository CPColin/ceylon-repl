import ceylon.ast.core {
    DifferenceOperation
}

Anything evaluateDifferenceOperation(Context context, DifferenceOperation operation) {
    value left = evaluate(context, operation.leftOperand);
    
    if (is SyntaxError left) {
        return left;
    }
    // TODO: should be able to have an else here
    if (!exists left) {
        return SyntaxError("Left operand cannot be null");
    }
    
    value right = evaluate(context, operation.rightOperand);
    
    if (is SyntaxError right) {
        return right;
    }
    
    return `function Invertible.minus`.memberInvoke(left, [], right);
}
