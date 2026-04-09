// webapp/js/rodado.js

/**
 * 1. ELIMINAR RODADO
 * Se llama desde el onclick del botón en la tabla.
 */
function eliminarRodado(patente) {
    if (!confirm(`¿Estás seguro de eliminar el rodado con patente: ${patente}?`)) return;

    fetch(`eliminarRodado?patente=${patente}`, { method: 'GET' })
        .then(response => {
            if (response.ok) {
                // Opción A: Recargar la página para ver cambios
                location.reload(); 
                // Opción B: Si querés borrar la fila sin recargar, 
                // deberías tener un id en el <tr> como id="fila-PATENTE"
                // document.getElementById(`fila-${patente}`).remove();
            } else {
                alert("Error al intentar eliminar el vehículo.");
            }
        })
        .catch(error => console.error("Error en eliminar:", error));
}

/**
 * 2. ACTUALIZAR RODADO
 * Se debe llamar en el evento onsubmit del formulario de edición.
 */
function actualizarRodado(event) {
    event.preventDefault(); // Evita que el formulario recargue la página

    const form = event.target;
    const formData = new URLSearchParams(new FormData(form));

    fetch(form.action, {
        method: 'POST',
        body: formData,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
    .then(response => {
        if (response.ok) {
            alert("¡Vehículo actualizado correctamente!");
            window.location.href = "listarRodado"; // Volver al listado
        } else {
            alert("Hubo un error al actualizar.");
        }
    })
    .catch(error => console.error("Error en actualizar:", error));
}

/**
 * 3. CREAR RODADO
 * Se debe llamar en el evento onsubmit del formulario de creación.
 */
function crearRodado(event) {
    event.preventDefault();

    const form = event.target;
    const formData = new URLSearchParams(new FormData(form));

    fetch(form.action, {
        method: 'POST',
        body: formData,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
    .then(response => {
        if (response.ok) {
            alert("¡Vehículo registrado con éxito!");
            window.location.href = "listarRodado";
        } else {
            alert("Error al registrar el vehículo.");
        }
    })
    .catch(error => console.error("Error en crear:", error));
}

/**
 * 4. LISTAR RODADOS (Refrescar tabla)
 * Esta función es útil si querés actualizar solo el cuerpo de la tabla
 * sin tocar el resto de la página.
 */
function refrescarTabla() {
    fetch("listarRodado")
        .then(response => response.text())
        .then(html => {
            // Suponiendo que tu tabla tiene un id="tablaRodados"
            // Esta lógica requiere que el servlet devuelva solo el fragmento de la tabla
            // o procesar el HTML completo. Por ahora, un reload es más simple.
            location.reload();
        })
        .catch(error => console.error("Error al refrescar:", error));
}
