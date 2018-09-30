import ceylon.ast.core {
    Node
}
import ceylon.ast.redhat {
    ...
}

"Run the module `com.crappycomic.ceylonrepl`."
shared void run() {
    value context = Context();
    
    print("Welcome to the Ceylon REPL!");
    
    while (true) {
        process.write(">> ");
        
        value line = process.readLine();
        
        if (!exists line) {
            break;
        }
        
        Node? node;
        
        try {
            node = parse(line);
        } catch (AssertionError e) {
            print("Parse error: ``e``");
            continue;
        }
        
        if (!exists node) {
            print("Unable to parse");
            continue;
        }
        
        print(node);
        
        value result = evaluate(context, node);
        
        print("\t``result else "<null>"``");
    }
}