<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CadastraUsuario.aspx.cs" Inherits="CadastraUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="style/Style.css" rel="stylesheet" />

    <title>FALCON DEX</title>
</head>
<body>
    <div class="row main">
        <div class="col-md-3 weapper menu">
            <nav class="navbar navbar-expand-md navbar-dark bg-primary">
                <div class="container">
                    <div class="sidebar-header">
                        <a class="navbar-brand " href="#">Usuario</a>
                    </div>
                    <button class="navbar navbar-toggler" type="button" data-target="#navbarMenu" data-toggle="collapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarMenu">

                        <ul class="navbar-nav nav flex-column">
                            <li class="nav-item">
                                <a href="#">
                                    <i></i>Perfil
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i></i>Chamados
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i></i>Técnicos
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i></i>Equipamentos
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i></i>Solicitantes
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i></i>Empréstimos
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i></i>Gráficos
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="TelaInicial.aspx" class="nav-link">
                                    <i></i>SAIR
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

            </nav>
        </div>
    <div class="col-md-9 ">
        <div class="container-fluid">
            <img class="img-fluid rounded float-left imgSeta" src="img/SetaRetorno.png" width="30" height="30" />

            <h1 class="aquarium">Aquarium</h1>

            <img class="img-fluid rounded float-right" src="img/captura de tela  principal.PNG" width="65" height="65" />
        </div>
        <div class="accordion " id="usuarios-accordion">
            <div class="card z-depth-0 bordered">
                <div class="card-header">
                    <h5 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne2"
                            aria-expanded="true" aria-controls="collapseOne2">
                            Tecnico 01
                        </button>
                    </h5>
                </div>
                <div id="collapseOne2" class="collapse" aria-labelledby="headingOne2"
                    data-parent="#usuarios-accordion">
                    <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3
        wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum
        eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla
        assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred
        nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
        farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus
        labore sustainable.
                    </div>
                </div>
            </div>
            <div class="card z-depth-0 bordered">
                <div class="card-header">
                    <h5 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                            data-target="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo2">
                            Tecnico 02
                        </button>
                    </h5>
                </div>
                <div id="collapseTwo2" class="collapse" aria-labelledby="headingTwo2"
                    data-parent="#usuarios-accordion">
                    <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3
        wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum
        eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla
        assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred
        nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
        farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus
        labore sustainable.
                    </div>
                </div>
            </div>
            <div class="card z-depth-0 bordered">
                <div class="card-header">
                    <h5 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                            data-target="#collapseThree2" aria-expanded="false" aria-controls="collapseThree2">
                            Tecnico 03
                        </button>
                    </h5>
                </div>
                <div id="collapseThree2" class="collapse" aria-labelledby="headingThree2"
                    data-parent="#usuarios-accordion">
                    <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3
        wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum
        eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla
        assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred
        nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
        farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus
        labore sustainable.
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script src="Scripts/jquery-3.5.1.slim.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
