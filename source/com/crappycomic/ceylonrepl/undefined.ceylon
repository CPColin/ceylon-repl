shared abstract class Undefined() of undefined {
    string = "<undefined>";
}

"Represents the state where evaluation results in no value."
shared object undefined extends Undefined() {}
