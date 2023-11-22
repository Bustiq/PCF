<!DOCTYPE html>
 
<html lang="en">
 
<head>
 
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/c4cbacb062.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.css'>
<link rel="stylesheet" href="../estilo.css">
 
 
    <title>PCF</title>
</head>
 
<body  style="background-color: #f7f4f2; " >
<header class="position-sticky top-0 " style="z-index:100000000">
 
  <nav class="navbar navbar-expand-lg bg-light mb-0" style="z-index: -1 !important;">
 
    <div class="container-fluid">
 
      <a class="navbar-brand p-0" href="../index.html"><img src="../Assets/MicrosoftTeams-image__2_-removebg-preview (1).png" style="width: 7%;" class="position-absolute"></a>
 
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
 
        <span class="navbar-toggler-icon"></span>
 
      </button>
 
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-5 ps-5">
          <li class="nav-item">
            <a class="nav-link active subrayado" aria-current="page" href="./help.html">Help</a>
          </li>
          <li class="nav-item">
            <a class="nav-link subrayado" href="./Restaurantes.html">Restaurantes</a>
          </li>
          <li class="nav-item">
            <a class="nav-link subrayado" href="./news.html">News</a>
          </li>
          <li class="nav-item">
            <a class="nav-link subrayado" href="#">Calculadora</a>
          </li>
        </ul>
      </div>
    </div>
 
    <div class="header-section container" style=" display: inline-block;" style="z-index: 1 !important;">
    <div class="logo"></div>
    <div style=" display: inline-block;">
    <i class="fas fa-shopping-cart cart"  style=" display: inline-block;" onclick="showCart(this)"></i>
    <p class="count-product" style=" display: inline-block;">0</p>
    </div>
    <div class="cart-products" id="products-id" style="z-index: 1 !important;" style=" display: inline-block;">
    <p class="close-btn" onclick="closeBtn()">X</p>
    <h3>Mi carrito</h3>
    <div class="card-items">
    </div>
    <h2>Calorias: <strong class="price-total">0</strong></h2>

    </div>
</div>
  </nav>
 
 
 
 
  </header>
 
<main style="z-index: -10;">
  <div class="w-75 m-auto" style="z-index: -1 !important;" >
  <ul class="cards mt-5 text-center justify-content-center z">
    <?php
    $servername = "127.0.0.1";
    $database = "PCF_SCHEMA2";
    $username = "alumno";
    $password = "alumnoipm";
    
    $conexion = mysqli_connect($servername, $username, $password, $database);
    if (!$conexion) {
      die("Conexion fallida: " . mysqli_connect_error());
    } else {
    $id = $_GET["id"];

      $resultado = mysqli_query($conexion, "SELECT * FROM Plato where Restaurante_idRestaurante = $id");

      if (mysqli_num_rows($resultado) > 0) {
        while ($fila = mysqli_fetch_assoc($resultado)) {  $platoID = $fila['idPlato'];
          $Cantidad = $fila['Calorias']; ?>
          <li class="cards_item" style="z-index: 1 !important;">
            <div class="card w-100">
              <div class="card_image ">
                <!-- img -->
                <img src="<?php echo $fila['imagen']; ?>" alt="<?php echo $fila['nombre']; ?>" />
              </div>
              <div class="card_content">
                <h2 class="card_title"><?php echo $fila['nombre']; ?></h2>
                <div class="card_text">
                  <p>Calorías: <span> <?php echo $fila['Calorias']; ?> </span></p>
                   <p>Proteínas: <?php echo $fila['Proteinas']; ?> g</p>
                  <p>Carbohidratos: <?php echo $fila['Carbohidratos']; ?> g</p>
                  <p>Grasas: <?php echo $fila['grasas']; ?></p>
                </div>
                <div class="text-center position-relative" style="z-index: 10 !important;">
            <a href="#" data-id= "<?php echo $platoID?>" data-price="<?php echo $Cantidad ?>" class="btn-add-cart">Add to Cart</a>
          </div>
              </div>
            </div>
          </li>
    <?php
        }
      } else {
        echo "No se encontraron productos.";
      }
    }
    mysqli_close($conexion);
    ?>
  </ul>
</div>
</div>
<script>
  function showCart(x){
      document.getElementById("products-id").style.display = "block";
  }
  function closeBtn(){
       document.getElementById("products-id").style.display = "none";
  }
 
</script>
 
</main>
 
    <footer></footer>
 
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js'></script>
 
    <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
 
   
    <script src="../main.js"></script>
 
 
 
  </body>
 
</html>