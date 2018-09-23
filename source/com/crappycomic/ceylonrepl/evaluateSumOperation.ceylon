import ceylon.ast.core {
    SumOperation
}

Anything evaluateSumOperation(Context context, SumOperation operation) {
    value left = evaluate(context, operation.leftSummand);
    
    if (is SyntaxError left) {
        return left;
    }
    
    if (!exists left) {
        return SyntaxError("Left operand cannot be null");
    }
    
    value right = evaluate(context, operation.rightSummand);
    
    if (is SyntaxError right) {
        return right;
    }
    
    return `function Summable.plus`.memberInvoke(left, [], right);
}
