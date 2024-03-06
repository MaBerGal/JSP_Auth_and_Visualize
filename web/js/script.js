// Método para ocultar todos los divs y mostrar uno en específico
function mostrarElementos() {
    // Oculta todos los elementos
    document.getElementById("desarrolladores").style.display = "none";
    document.getElementById("bandas").style.display = "none";
    document.getElementById("fabricantes").style.display = "none";
    document.getElementById("consolas").style.display = "none";
    document.getElementById("juegos").style.display = "none";
    document.getElementById("jugadores").style.display = "none";

    // Obtiene el valor seleccionado
    var categoriaSeleccionada = document.getElementById("categoriaSelector").value;

    // Muestra los elementos según la categoría seleccionada
    document.getElementById(categoriaSeleccionada).style.display = "block";
}
