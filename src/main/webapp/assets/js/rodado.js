// webapp/js/rodado.js

// En webapp/assets/js/rodado.js
function eliminarRodado(patente) {
    // Si la librería no cargó, usamos el confirm nativo del navegador
    if (typeof Swal === 'undefined') {
        if (confirm(`¿Estás seguro de eliminar el rodado con patente: ${patente}?`)) {
            ejecutarFetchEliminar(patente);
        }
        return;
    }

    // Código con SweetAlert
    Swal.fire({
        title: '¿Eliminar vehículo?',
        text: `La patente ${patente} se borrará permanentemente`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#ff5b5c',
        cancelButtonColor: '#a3aed0',
        confirmButtonText: 'Sí, eliminar',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            ejecutarFetchEliminar(patente);
        }
    });
}

/**
 * FUNCIÓN AUXILIAR DE ELIMINACIÓN
 */
function ejecutarFetchEliminar(patente) {
    // Mostramos un pequeño indicador de carga
    if (typeof Swal !== 'undefined') {
        Swal.showLoading();
    }

    fetch(`eliminarRodado?patente=${patente}`)
        .then(response => {
            // No importa si el servlet hace redirect o devuelve OK, 
            // si la respuesta es exitosa (200-299), procedemos.
            if (response.ok) {
                if (typeof Swal !== 'undefined') {
                    Swal.fire('¡Borrado!', 'El vehículo fue eliminado.', 'success')
                        .then(() => {
                            // FORZAMOS la recarga de la página para limpiar el listado
                            window.location.href = "listarRodado";
                        });
                } else {
                    alert("¡Vehículo eliminado!");
                    window.location.href = "listarRodado";
                }
            } else {
                throw new Error("Error en la respuesta del servidor");
            }
        })
        .catch(error => {
            console.error("Error:", error);
            // Si algo falla, avisamos y refrescamos igual para sincronizar estado
            alert("El proceso terminó. Refrescando lista...");
            window.location.href = "listarRodado";
        });
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
		    alert("¡Éxito! El rodado se guardó."); // Opcional: un cartelito antes de irse
		   window.location.href = "/listarRodado" // <--- ESTO hace la redirección
		} else {
		    alert("Error en el servidor");
		}
    })
    .catch(error => console.error("Error en crear:", error));
}

function refrescarTabla() {
    // Pedimos de nuevo el listado al Servlet
    fetch("listarRodado") 
        .then(response => response.text()) // Recibimos el HTML de la página entera
        .then(html => {
            // Creamos un elemento temporal para "parsear" ese HTML
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, 'text/html');
            
            // Extraemos SOLO el contenido de la nueva tabla
            const nuevaTabla = doc.getElementById('contenedorTabla').innerHTML;
            
            // Reemplazamos el contenido viejo con el nuevo en la página actual
            document.getElementById('contenedorTabla').innerHTML = nuevaTabla;
            
            console.log("Tabla actualizada con AJAX");
        });
}

