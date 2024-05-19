# Importar los paquetes necesarios
using HTTP
using JSON

# Función para manejar la opción de argumentos de línea de comando
function handle_command_line_arguments()
    println("\nCommand Line Arguments:")
    if length(ARGS) == 0
        println("No command line arguments provided.")
    else
        for (i, arg) in enumerate(ARGS)
            println("Argument $i: $arg")
        end
    end
end

# Función para manejar la opción de flujos estándar
function handle_standard_streams()
    println("\nStandard Streams:")
    print("Enter something: ")
    user_input = readline()
    println("You entered: $user_input")
    println("This is standard output")
    println(stderr, "This is standard error")
end

# Función para manejar la opción de variables de ambiente
function handle_environment_variables()
    println("\nEnvironment Variables:")
    home_dir = get(ENV, "HOME", "Unknown")
    println("Home directory: $home_dir")
    ENV["MY_VAR"] = "Hello, Environment!"
    println("MY_VAR: ", ENV["MY_VAR"])
end

# Función para manejar la opción de entrada/salida de archivos
function handle_file_io()
    println("\nFile I/O:")
    filename = "example.txt"
    open(filename, "w") do file
        write(file, "Hello, file!")
    end
    content = read(filename, String)
    println("File content: $content")
end

# Función para manejar la opción de entrada/salida de red
function handle_network_io()
    println("\nNetwork I/O:")
    url = "https://jsonplaceholder.typicode.com/posts/1"
    response = HTTP.get(url)
    if response.status == 200
        println("Status: ", response.status)
        json_response = JSON.parse(String(response.body))
        println("Response:")
        println(json_response)
    else
        println("Error: Unable to fetch data from $url")
    end
end

# Función principal
function main()
    while true
        println("\nSelect an option:")
        println("1. Command Line Arguments")
        println("2. Standard Streams")
        println("3. Environment Variables")
        println("4. File I/O")
        println("5. Network I/O")
        println("6. Exit")
        print("Enter your choice: ")
        
        choice = readline()
        
        if choice == "1"
            handle_command_line_arguments()
        elseif choice == "2"
            handle_standard_streams()
        elseif choice == "3"
            handle_environment_variables()
        elseif choice == "4"
            handle_file_io()
        elseif choice == "5"
            handle_network_io()
        elseif choice == "6"
            println("\nExiting...")
            break
        else
            println("\nInvalid choice, please try again.")
        end
    end
end

# Llamar a la función principal
main()
