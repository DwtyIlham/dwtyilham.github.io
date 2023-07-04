<?= $this->extend('template/template'); ?>

<?= $this->section('content'); ?>

<body>
    <div class="container-fluid">
        <?php
        if (session()->getFlashdata('login-success')) : ?>
            <div class="login-message alert alert-success text-center">
                <?= session()->getFlashdata('login-success'); ?>
            </div>
        <?php endif; ?>
        <div class="regIndex d-flex align-items-center justify-content-center">
            <div class="text-center">
                <h3>Pendataan Club</h3>
                <div class="input-group">
                    <a href="<?= BASE; ?>home/official" class="btn btn-outline-primary">Pendataan Official Club</a>
                    <a href="<?= BASE; ?>home/atlet" class="btn btn-outline-success">Pendataan Atlet Club</a>
                </div>
            </div>
        </div>
    </div>
    <?= $this->endSection(); ?>