import ceylon.ast.core {
    Block
}

Anything evaluateBlock(Context context, Block block) {
    variable Anything result = null;
    
    for (child in block.content) {
        result = evaluate(context, child);
        
        if (result is SyntaxError) {
            break;
        }
    }
    
    return result;
}
