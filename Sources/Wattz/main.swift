import Darwin
import Arguments

let commands = Set([Arguments.helpArg])

let arguments = Arguments(arguments: commands)

do {
    let commandLineArguments = try arguments.readCommandLineArguments(args: CommandLine.arguments)
    for arg in commandLineArguments {
        switch arg {
        case Arguments.helpArg:
            print("Generate code")
        default:
            break
        }
    }
} catch ArgumentError.emptyArguments {
    print("No commands were found")
    exit(1)
} catch ArgumentError.missingRequiredArguments(args: let args) {
    for a in args {
        print("Required command \(a) was not found\n")
    }
} catch ArgumentError.unknownArgument(arg: let arg) {
    print("Unknown command was found \(arg)")
    exit(1)
} catch {
    print("Unknown error with arguments")
    exit(1)
}
