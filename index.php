<?php
session_start();
error_reporting(0);
require_once("system/a_func.php");
if (isset($_SESSION['id'])) {
    $q1 = dd_q("SELECT * FROM users WHERE id = ? LIMIT 1", [$_SESSION['id']]);
    if ($q1->rowCount() == 1) {
        $user = $q1->fetch(PDO::FETCH_ASSOC);
    } else {
        session_destroy();
        $_GET['page'] = "login";
    }
}
$get_static = dd_q("SELECT * FROM static");
$static = $get_static->fetch(PDO::FETCH_ASSOC);
// $config["pri_color"]   = "#FF2B2B";
// $config["sec_color"]  = "#9A0D0D";
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta property="og:title" content="<?php echo $config['name']; ?> - ยินดีต้อนรับ">
    <meta property="og:type" content="website">
    <meta property="og:url" content="<?= $_SERVER['SERVER_NAME'] ?>">
	 <meta property="og:image" content="https://gifdb.com/images/high/cool-anime-yui-hirasawa-k-on-b90459ws3s9us66w.gif" />
    <meta name="theme-color" content="#5ACCD0">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@yosiket" />
    <meta name="twitter:card" content="summary_large_image">
    <meta property="og:image" content="<?php echo $config['bg3']; ?>">
    <meta property="og:description" content="<?php echo $config['des']; ?>">

    <title><?php echo $config['name']; ?></title>
    <link rel="shortcut icon" href="<?php echo $config['logo']; ?>" type="image/png" sizes="16x16">

    <link rel="stylesheet" href="system/css/second.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <script src="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <!-- <link rel="stylesheet" href="system/gshake/css/box.css"> -->
    <!--<script type="text/javascript" src="system/js/main.js"></script> -->
    <link href="https://kit-pro.fontawesome.com/releases/v6.2.0/css/pro.min.css" rel="stylesheet">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@600&family=Kanit&display=swap" rel="stylesheet">
    <style>
        :root {
            --main: <?php echo $config["main_color"]; ?>;
            --sub: <?php echo $config["sec_color"]; ?>;
            --sub-opa-50: <?php echo $config["main_color"]; ?>80;
            --sub-opa-25: <?php echo $config["main_color"]; ?>;
        }
    </style>
    <link rel="stylesheet" href="system/css/option.css">
    <style>
        .owl-items {
            max-width: 220px;
            max-height: 220px;

        }

        .owl-items img {
            border-radius: 25px !important;
            animation: glow 1s infinite ease-in-out;

        }

        body {
            background-image: url('<?= $config['bg2'] ?>');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
            overflow-x: hidden;
        }

        .snowflake {
            position: absolute;
            width: 11px;
            height: 11px;
            background: #00C5FF;
            /* Workaround for Chromium's selective color inversion */
            border-radius: 50%;
            filter: drop-shadow(0 0 10px dark);
        }


        button.custom-button {
            position: relative;
            padding: 10px 20px;
            border-radius: 7px;
            border: 1px solid rgb(61, 106, 255);
            font-size: 14px;
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 2px;
            background: transparent;
            color: #fff;
            overflow: hidden;
            box-shadow: 0 0 0 0 transparent;
            transition: all 0.2s ease-in;
        }

        button.custom-button:hover {
            background: rgb(61, 106, 255);
            box-shadow: 0 0 30px 5px rgba(0, 142, 236, 0.815);
            transition: all 0.2s ease-out;
        }

        button.custom-button:hover::before {
            animation: sh02 0.5s 0s linear;
        }

        button.custom-button::before {
            content: '';
            display: block;
            width: 0px;
            height: 86%;
            position: absolute;
            top: 7%;
            left: 0%;
            opacity: 0;
            background: #fff;
            box-shadow: 0 0 50px 30px #fff;
            transform: skewX(-20deg);
        }

        @keyframes sh02 {
            from {
                opacity: 0;
                left: 0%;
            }

            50% {
                opacity: 1;
            }

            to {
                opacity: 0;
                left: 100%;
            }
        }

        button.custom-button:active {
            box-shadow: 0 0 0 0 transparent;
            transition: box-shadow 0.2s ease-in;
        }
    </style>
</head>

<body>
<div id="snow" data-count="200"></div>
<nav class="navbar navbar-expand-lg navbar-white bg-black mt-0 shadow-sm mb-0">
        <div class="container-sm pt-2 pb-3 ps-4 pe-4 ">
            <!-- <div class="container-sm"></div> -->
            <!-- <a class="navbar-brand d-lg-none" href="/?page=home"><img src="<?php echo $config['logo']; ?>" height="auto" width="55"></a> -->
            <a class="navbar-brand text-white" href="/?page=home"><img src="<?= $config['logo'] ?>" height="100px" width="auto"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon text-white mt-1"><i class="fa-solid fa-list-timeline"></i></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent" >
                <?php
                // if(isset($_SESSION['id'])){
                ?>
                <ul class="navbar-nav mx-auto me-auto mb-1 mb-lg-0 bg-black">
                    <li class="nav-item align-self-center ms-lg-3">
                        <a class="nav-link underline-active align-self-center text-white" aria-current="page" href="/?page=home"><img src="	https://themoons.store/assets/icon/home.png" width="25" class="mb-1">&nbsp;หน้าหลัก</a>
                    </li>
                    <ul class="nav-item align-self-center">
                        <li class="nav-item dropdown" style="list-style: none;">
                            <a class="nav-link underline-active align-self-center text-white" aria-current="page" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="https://themoons.store/assets/icon/shop.png" width="25" class="mb-1">&nbsp;สินค้า</a>
                            <ul class="dropdown-menu shadow-sm p-3 pt-2 pb-2" style="border-radius: 0px;" aria-labelledby="navbarDropdown">
                                <li>
                                    <a class="dropdown-item text-dark mb-1 text-dark" aria-current="page" href="/?page=appresec"><small><i class="fa fa-archive"></i>&nbsp;สินค้า</small></a>
                                </li>
                                <!-- <li>
                                    <a class="dropdown-item text-dark mb-1 text-dark" aria-current="page" href="/?page=random_wheel"><small><img src="	https://themoons.store/assets/icon/spin.png" width="15%">&nbsp;วงล้อสุ่มสินค้า</small></a>
                                </li> -->
                            </ul>
                        </li>
                    </ul>

                    <li class="nav-item align-self-center ms-lg-3">
                        <a class="nav-link underline-active align-self-center text-white" aria-current="page" href="/?page=payment"><img src="	https://themoons.store/assets/icon/coin.png" width="25" class="mb-1">&nbsp;เติมเงิน</a>
                    </li>
                    <li class="nav-item align-self-center ms-lg-3">
                        <a class="nav-link underline-active align-self-center text-white" aria-current="page" href="/?page=history"><img src="	https://themoons.store/assets/icon/pw-shop.png" width="25" class="mb-1">&nbsp;ประวัติสั่งซื้อ</a>
                    </li>
                    <ul class="nav-item align-self-center">
                        <li class="nav-item dropdown" style="list-style: none;">
                            <a class="nav-link underline-active align-self-center text-white" aria-current="page" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="https://themoons.store/assets/icon/call-center1.png" width="25" class="mb-1">&nbsp;ติดต่อ</a>
                            <ul class="dropdown-menu shadow-sm p-3 pt-2 pb-2" style="border-radius: 0px;" aria-labelledby="navbarDropdown">
                                <li>
                                    <a class="dropdown-item text-dark mb-1 text-black" href="https://www.facebook.com/dx.2005.17/"><small><img src="https://media.discordapp.net/attachments/986179882545467423/1148118885111975966/facebook.png?width=642&height=633" width="20" class="mb-1">&nbsp;Facebook</small></a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                </ul>
                <?php
                // }
                ?>
                <?php
                if (!isset($_SESSION['id'])) {
                ?>
                        <ul class="navbar-nav ms-auto  mb-2 mb-lg-0 ">
                        <li class="nav-item">
                            <a class="btn nav-link active mr-2 mt-2 text-black" aria-current="page" href="?page=login">
                            <button class="custom-button">เข้าสู่ระบบ</button>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="btn nav-link active mr-2 mt-2 text-black" aria-current="page" href="?page=register">
                            <button class="custom-button">สมัครสมาชิก</button>
                            </a>
                        </li>
                    </ul>
                <?php
                } else {    
                ?>
                    <ul class="navbar-nav ms-auto  mb-2 mb-lg-0 bg-black ">
                        <li class="nav-item">
                        <button class="btn btn-light">ยอดเงินคงเหลือ <b class="text-primary">฿<?php echo number_format($user["point"]); ?></b> บาท</button>
                          

                            <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                            <button type="button" class="btn btn-info hvr-icon-up"><i class="fa-solid fa-user hvr-icon"></i> <?php echo htmlspecialchars(strtoupper($user['username'])); ?></button>
                            <div class="btn-group" role="group">
                                <button id="btnGroupDrop2" type="button" class="btn btn-info dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop2">
                                <?php
                                if ($user["rank"] == "1") {
                                ?>
                                        <a class="dropdown-item" href="?page=backend"><i class="fa-solid fa-code"></i> จัดการหลังบ้าน</a>
                                <?php
                                }
                                ?>
                                    <a class="dropdown-item" href="?page=profile&subpage=cpass"><i class="fa-solid fa-user hvr-icon"></i> ข้อมูลส่วนตัว</a>
                                    
                                    <a class="dropdown-item" href="?page=logout"><i class="fa-solid fa-right-from-bracket hvr-icon"></i>ออกจากระบบ</a>
                                </ul>
                                </div>
                            </ul>
                        </li>
                    </ul>
                <?php
                }
                ?>
                
            </div>
        </div>
    </nav>
    <?php
      function admin($user)
    {
        if (isset($_SESSION['id']) && $user["rank"] == "1") {
            return true;
        } else {
            return false;
        }
    }
    if (isset($_GET['page']) && $_GET['page'] == "menu") {
        require_once('page/simple.php');
    } elseif (isset($_GET['page']) && $_GET['page'] == "login" && !isset($_SESSION['id'])) {
        require_once('page/login.php');
    } elseif (isset($_GET['page']) && $_GET['page'] == "logout" && isset($_SESSION['id'])) {
        session_destroy();
        echo "<script>window.location.href = '';</script>";
    } elseif (isset($_GET['page']) && $_GET['page'] == "profile" && isset($_SESSION['id'])) {
        require_once('page/profile.php');

    } elseif (isset($_GET['page']) && $_GET['page'] == "angpao") {
        if (isset($_SESSION['id'])) {
            require_once('page/angpao.php');
        } else {
            require_once('page/login.php');
        }

    } elseif (isset($_GET['page']) && $_GET['page'] == "payment") {
        if (isset($_SESSION['id'])) {
            require_once('page/payment.php');
        } else {
            require_once('page/login.php');
        }
        
    } elseif (isset($_GET['page']) && $_GET['page'] == "connect") {
        if (isset($_SESSION['id'])) {
            require_once('page/connect.php');
        } else {
            require_once('page/login.php');
        }

    } elseif (isset($_GET['page']) && $_GET['page'] == "redeem") {
        if (isset($_SESSION['id'])) {
            require_once('page/redeem.php');
        } else {
            require_once('page/login.php');
        }
        
    } elseif (isset($_GET['page']) && $_GET['page'] == "id") {
        if (isset($_SESSION['id'])) {
            require_once('page/id.php');
        } else {
            require_once('page/login.php');
        }
    } elseif (isset($_GET['page']) && $_GET['page'] == "gp") {
        if (isset($_SESSION['id'])) {
            require_once('page/gp.php');
        } else {
            require_once('page/login.php');
        }
    } elseif (isset($_GET['page']) && $_GET['page'] == "product" && isset($_GET['id'])) {
        if (isset($_SESSION['id'])) {
            require_once('page/product.php');
        } else {
            require_once('page/login.php');
        }
    } elseif (isset($_GET['page']) && $_GET['page'] == "slidebloxfruit") {
        if (isset($_SESSION['id'])) {
            require_once('page/csgo_1.php');
        } else {
            require_once('page/login.php');
        }
    } elseif (isset($_GET['page']) && $_GET['page'] == "id_p" && isset($_GET['id'])) {
        if (isset($_SESSION['id'])) {
            require_once('page/id_p.php');
        } else {
            require_once('page/login.php');
        }
    } elseif (isset($_GET['page']) && $_GET['page'] == "spin") {
        if (isset($_SESSION['id'])) {
            require_once('page/random_wheel.php');
        } else {
            require_once('page/login.php');
        }
    } elseif (isset($_GET['page']) && $_GET['page'] == "play" && isset($_GET['wheel'])) {
        if (isset($_SESSION['id'])) {
            require_once('page/play.php');
        } else {
            require_once('page/login.php');
        }
        
    } elseif (isset($_GET['page']) && $_GET['page'] == "history") {
        if (isset($_SESSION['id'])) {
            require_once('page/history.php');
        } else {
            require_once('page/login.php');
        }

    } elseif (isset($_GET['page']) && $_GET['page'] == "shop") {
        if (isset($_SESSION['id'])) {
            require_once('page/shop.php');
        } else {
            require_once('page/login.php');
        }
    } elseif (isset($_GET['page']) && $_GET['page'] == "buy") {
        if (isset($_SESSION['id'])) {
            require_once('page/buy.php');
        } else {
            require_once('page/login.php');
        }
    } elseif (isset($_GET['page']) && $_GET['page'] == "register" && !isset($_SESSION['id'])) {
        require_once('page/register.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "backend") {
        require_once('page/backend/menu_manage.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "user_edit") {
        require_once('page/backend/menu_manage.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "angpao_manage") {
        require_once('page/backend/menu_manage.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "product_manage") {
        require_once('page/backend/menu_manage.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "stock_manage" && $_GET['id'] != "") {
        require_once('page/backend/menu_manage.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "wheel_manage") {
        require_once('page/backend/menu_manage.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "wheel_cate") {
        require_once('page/backend/menu_manage.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "wheel") {
        require_once('page/backend/menu_manage.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "stock_wheel" && $_GET['id'] != "") {
        require_once('page/backend/menu_manage.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "code_manage") {
        require_once('page/backend/menu_manage.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "category_manage") {
        require_once('page/backend/menu_manage.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "backend_buy_history") {
        require_once('page/backend/menu_manage.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "backend_topup_history") {
        require_once('page/backend/menu_manage.php');
   } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "carousel_manage") {
        require_once('page/backend/menu_manage.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "recom_manage") {
        require_once('page/backend/menu_manage.php');
		} elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "allmonney") {
        require_once('page/backend/moneyontop.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "crecom_manage") {
        require_once('page/backend/menu_manage.php');
    } elseif (admin($user) && isset($_GET['page']) && $_GET['page'] == "website") {
        require_once('page/backend/menu_manage.php');
    } else {
        require_once('page/simple.php');
    }
    ?>    <div class="modal fade" id="buy_count" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal_title"><i class="fa-duotone fa-cart-shopping-fast"></i>&nbsp;&nbsp;สั่งซื้อสินค้า</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-3 pb-2">
                    <div class="row mt-2">
                        <div class="col">
                            <hr>
                        </div>
                        <div class="col-auto">จำนวนสินค้าที่จะซื้อ</div>
                        <div class="col">
                            <hr>
                        </div>
                        <div class="mb-2">
                            <!-- <p class="mb-1 text-secondary">กรอกจำนวนที่ต้องการสั่งซื้อ<span class="text-danger">*</span></p> -->
                            <!-- <div class="input-group-prepend">
                                <button class="btn btn-outline-secondary" type="button" id="quantity-minus">-</button>
                            </div> -->
                            <input type="number" id="b_count" class="form-control text-center" value="1">
                            <!-- <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" id="quantity-plus">+</button>
                            </div> -->
                        </div>
                        <div class="d-flex justify-content-between pe-3 ps-3 mt-2">
                            <span class="m-0 align-self-center">สินค้าคงเหลือ <?php echo $count; ?> ชิ้น</span>
                            <span class="m-0 align-self-center" style="color: white; padding: 3.5px 5px; border-radius: 1vh; background-color: var(--main);">ยอดเงินคงเหลือ <?php echo $user["point"]; ?></span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="shop-btn" class="btn w-100" style="background-color: var(--main); color: #fff;" onclick="buybox()" data-id="" data-name="" data-price=""><i class="text-black fa-duotone fa-cart-shopping-fast"></i>&nbsp;&nbsp;สั่งซื้้อเลย</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <!-- on -->
    <footer class="bg-light shadow-sm pt-3">
            <div class="container">
                <div class="row">
                <center>
                    <div class="col-12 col-lg-4 text-center mb-3">
                        <img src="<?= $config['logo'] ?>" width="200">
                        <br><?php echo $config['name']; ?><br>
                        <h5></h5>
                        <p><?php echo $config['des']; ?></p>
                    </div>

                    <div class="col-12 col-lg-2 text-center mb-3">
                        <h5>ช่องทางการติดต่อ</h5>
                        <a href="<?php echo $config['facebook']; ?>" style="text-decoration: none;" class="text-dark"><i class="fa-brands fa-facebook"></i> Facebook</a><br>
                        <a href="<?php echo $config['discord'] ?>" style="text-decoration: none;" class="text-dark"><i class="fa-brands fa-discord"></i> Discord</a><br>
                    </div>

                    <div class="col-12 col-lg-4 text-center mb-3">
                        <div id="fb-root"></div>
                        <script async="" defer="" crossorigin="anonymous" src="https://connect.facebook.net/th_TH/sdk.js#xfbml=1&amp;version=v16.0" nonce="ExHRiLWq"></script>
                        
                    </div>
                    </center>
                    
                </div>
                <hr>
                <center>
                    <p class=" mb-1"><strong><i class="fa-regular fa-copyright"></i>&nbsp; 2024, All right reserved.</strong></p>
                    <small class="mb-1"><i class="fa-solid fa-cog fa-spin"></i>&nbsp; THEMOON DEV <a href="<?php echo $config['facebook']; ?>" style="text-decoration: none;color: #39b3fe" class=""> ติดต่อเจ้าของร้านไม่ได้ / แจ้งปัญหาร้านค้าโกง</a></small>
                </center>
            </div>
</footer>

    <!-- off -->
    <!--<div class="container-fluid pt-3 pb-3">
        <center>
            <p class="text-main mb-1 "><strong><i class="fa-regular fa-copyright"></i>&nbsp; 2024 <?php echo $config['name']; ?>, All right reserved.</strong></p>
            <small class="text-main mb-1 "></i>&nbsp; THEMOON DEV<a href="<?php echo $config['discord']; ?>" class="text-main mb-1"><i class="fa-solid fa-triangle-exclamation fa-fade"></i>&nbsp;ติดต่อเจ้าของร้านไม่ได้ / แจ้งปัญหาร้านค้าโกง</a></small>
        </center>
    </div> -->

    <script>
        async function shake_alert(status, result) {
            if (status) {
                if (result.salt == "prize") {
                    // await GShake();
                    Swal.fire({
                        icon: 'success',
                        title: 'สำเร็จ',
                        text: result.message
                    }).then(function() {
                        window.location = "?page=history";
                    });
                } else {
                    await GShake();
                    Swal.fire({
                        icon: 'error',
                        title: 'เสียใจด้วย',
                        text: result.message
                    });
                }
            } else {
                if (result.salt == "salt") {
                    // await GShake();
                    Swal.fire({
                        icon: 'error',
                        title: 'เสียใจด้วย',
                        text: result.message
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'ผิดพลาด',
                        text: result.message
                    });
                }
            }
        }

        function buybox() {
            var name = $("#shop-btn").attr("data-name");
            var price = $("#shop-btn").attr("data-price");
            var count = $("#b_count").val();
            var formData = new FormData();
            formData.append('id', $("#shop-btn").attr("data-id"));
            formData.append('count', count);
            Swal.fire({
                title: 'ยืนยันการสั่งซื้อ?',
                text: name + " " + count + " ชิ้น " + " ราคา " + price * count + " บาท ",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'ซื้อเลย'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: 'POST',
                        url: 'system/buybox.php',
                        data: formData,
                        contentType: false,
                        processData: false,
                        beforeSend: function() {
                            $('#btn_buyid').attr('disabled', 'disabled');
                            $('#btn_buyid').html('<span class="spinner-border spinner-border-sm mr-2" role="status" aria-hidden="true"></span>รอสักครู่...');
                        },
                    }).done(function(res) {
                        console.log(res)
                        result = res;
                        // await GShake();
                        shake_alert(true, result);
                        console.clear();
                        $('#btn_buyid').html('<i class="fas fa-shopping-cart mr-1"></i>สั่งซื้อสินค้า');
                        $('#btn_buyid').removeAttr('disabled');
                    }).fail(function(jqXHR) {
                        console.log(jqXHR)
                        res = jqXHR.responseJSON;
                        shake_alert(false, res);

                        $('#btn_buyid').html('<i class="fas fa-shopping-cart mr-1"></i>สั่งซื้อสินค้า');
                        $('#btn_buyid').removeAttr('disabled');
                    });
                }
            })
        }
    </script>
    <script>
        AOS.init();
    </script>
    <script src="system/js/snowfall.js"></script>
    <script>
        // Создаем объект с параметрами по умолчанию
        let defaultParams = {
            count: "100", // number of snowflakes
            minRadius: "10", // minimum radius of a snowflake in pixels
            maxRadius: "30", // maximum radius of a snowflake in pixels
            minSpeed: "1", // minimum speed of a snowflake in pixels per frame
            maxSpeed: "10", // maximum speed of a snowflake in pixels per frame
            text: "❄", // text for a snowflake (can be any symbol or text)
            color: "#99ccff", // color of a snowflake in HEX format
            zIndex: "1000" // z-index for the snowflakes canvas
        };

        // Создаем снегопад с параметрами по умолчанию
        let snowfall = new Snowfall();

        // Находим форму на странице
        let form = document.getElementById("form");
        // Находим кнопку "Default" на странице
        let defaultButton = document.getElementById("default");

        // Добавляем обработчик события на форму
        form.addEventListener("submit", event => {
            // Отменяем действие по умолчанию (отправку формы)
            event.preventDefault();
            // Создаем пустой объект для новых параметров
            let newParams = {};
            // Перебираем все элементы input в форме
            for (let input of form.elements) {
                // Если элемент имеет атрибут name, то добавляем его в объект новых параметров
                if (input.name) {
                    newParams[input.name] = input.value;
                }
            }

            // Удаляем старый снегопад
            snowfall.destroy();
            // Создаем новый снегопад с новыми параметрами
            snowfall = new Snowfall(newParams);
        });

        // Добавляем обработчик события на кнопку "Default"
        defaultButton.addEventListener("click", () => {
            // Удаляем старый снегопад
            snowfall.destroy();
            // Создаем новый снегопад с параметрами по умолчанию
            snowfall = new Snowfall();
            // Перебираем все элементы input в форме
            for (let input of form.elements) {
                // Если элемент имеет атрибут name, то устанавливаем его значение равным значению по умолчанию
                if (input.name) {
                    input.value = defaultParams[input.name];
                }
            }
        });
    </script>
</body>

</html>
<?php

?>