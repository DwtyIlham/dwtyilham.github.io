<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= BASE; ?>/css/style.css" />
    <link rel="stylesheet" href="<?= BASE; ?>/css/bootstrap.min.css" />
    <link rel="stylesheet" href="<?= BASE; ?>/css/fa.css" />
    <link rel="shortcut icon" href="<?= BASE; ?>/img/perbasi.ico" type="image/x-icon">
    <script src="<?= BASE; ?>/js/register.js"></script>
    <script src="<?= BASE; ?>/js/bootstrap.min.js"></script>
    <script src="<?= BASE; ?>/js/lottie-player.js"></script>
    <script src="<?= BASE; ?>/js/typewriter.js"></script>
    <script src="<?= BASE; ?>/js/fa.js"></script>
    <?php if (uri_string() !== 'login') : ?>
        <title><?= ucwords($user) . ' | ' . $title; ?></title>
    <?php endif; ?>
</head>
<?php if (uri_string() !== 'login') : ?>
    <nav class="navbar">
        <div class="navbar-container">
            <a class="navbar-logo" href="#"><img src="<?= base_url(); ?>/img/perbasi.png" width="50px" alt=""></a>
            <ul class="navbar-menu">
                <li class="navbar-item"><a href="<?= base_url(); ?>"><?= ucwords($user) ?>'s Home</a></li>
                <!-- <li class="navbar-item"><a href="#">About</a></li>
            <li class="navbar-item"><a href="#">Contact</a></li> -->
            </ul>
        </div>
        <li class="navbar-item nav-corner-right"><a href="<?= BASE; ?>logout" class="logout text-danger"><i class="fa fa-sign-out"></i> Logout</a></li>
    </nav>
<?php endif; ?>

<body class="mb-3">
    <!-- Content -->
    <?= $this->renderSection('content'); ?>
    <!-- End Content -->
</body>

<!-- Footer -->
<script src="<?= BASE; ?>/js/code.jquery.com_jquery-3.7.0.js"></script>
<script>
    $(document).ready(function() {
        $(".flash-message").show().slideDown(400).delay(3500).slideUp(400);
        $(".login-message").show().slideDown(400).delay(3000).slideUp(400);
    });

    // $(document).ready(function() {
    //     $('.login-message').fadeOut(5000);
    // })
</script>

</html>