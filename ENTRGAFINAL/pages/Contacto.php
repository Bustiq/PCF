<?php
    $Nombre= $_GET["Nombre"];
    $Mail = $_GET["Mail"];
    $Ncontacto = $_GET["Ncontacto"];
    $Mensaje = $_GET["Mensaje"];
    $servername = "127.0.0.1";
    $database = "PCF_SCHEMA2";
    $username = "alumno";
    $password = "alumnoipm";
 
    
    
    $conexion = mysqli_connect($servername, $username, $password, $database); // se crea la conexion
 
 
    if (!$conexion) {
        die("Conexion fallida: " . mysqli_connect_error());
    }
    else{
        
        $resultado=mysqli_query($conexion,"insert into Usuarios values(null, '$Nombre', '$Mail', '$Ncontacto');");
        //$fila = mysqli_fetch_assoc($resultado);
        //$id = $fila['idClientes'];
        
        //$resultado=mysqli_query($conexion,"insert into Mensajes values(null, '$Mensaje', '$id');");
   
        $resultado = mysqli_query($conexion,"select * from Usuarios;");
        
        echo "Datos que hay en la base:\n";
        while($fila=mysqli_fetch_assoc($resultado)){
            ?>
            <p><?php echo $fila['Nombre']?></p>
            <?php
        }
    }
    mysqli_close($conexion);
?>