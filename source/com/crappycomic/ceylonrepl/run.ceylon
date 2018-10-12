import com.crappycomic.ceylonrepl.evaluate {
    evaluate
}
import com.crappycomic.ceylonrepl.parse {
    parse
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Node
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
        
        value node = parse(line);
        
        if (!exists node) {
            print("Unable to parse");
            continue;
        }
        
        print(node);
        
        value result = evaluate(context, node);
        
        if (is Node result) {
            print("\t<node>");
        } else if (is SyntaxError result) {
            print("\tSyntax Error: ``result``");
        } else {
            print("\t``result else "<null>"``");
        }
    }
}
