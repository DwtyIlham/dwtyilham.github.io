<?= $this->extend('template/template'); ?>
<?php $session = $_SESSION; ?>

<?= $this->section('content'); ?>
<section>
    <!-- <img class="mx-auto" src="/img/perbasi.png" height="100" alt="" /> -->
    <div class="container">
        <!-- <div class="lottie">
                <lottie-player src="lottie/33490-play-basketball.json" background="transparent" speed="1" style="width: 720; height: 480px;" loop autoplay></lottie-player>
            </div> -->
        <div class="alert flash-message text-center" style="z-index: 9999;">
            <?= view('Myth\Auth\Views\_message_block') ?>
        </div>
        <div class="user signinBx">
            <div class="m-auto text-center">
                <h4 class="imgBx text-secondary text-center align-middle my-auto mx-auto mb-2"><span>PERBASI</span>&nbsp;<p id="textWriterLeft"></p>
                </h4>
                <img class="imgBx mx-auto" src="<?= BASE; ?>/img/perbasi.png" height="100" alt="" />
            </div>
            <div class="formBx">
                <form action="<?= url_to('login'); ?>" method="post">
                    <img class="imgMobile" src="<?= BASE; ?>/img/perbasi.png" height="100" alt="" />
                    <?= csrf_field() ?>
                    <h2>LOGIN</h2>
                    <input type="text" class="<?php if (session('errors.login')) : ?>is-invalid<?php endif ?>" name="login" placeholder="Username" required />
                    <input type="password" name="password" placeholder="Password" required />
                    &nbsp;
                    <input type="submit" name="" value="Login" />
                    <p class="signup">
                        BELUM PUNYA AKUN ?
                        <a href="#" onclick="toggleForm();">REGISTRASI</a>
                    </p>
                </form>
            </div>
        </div>
        <div class="user signupBx">
            <div class="formBx">
                <?= csrf_field() ?>
                <form action="<?= url_to('register') ?>" method="post">
                    <h2>REGISTRASI AKUN</h2>
                    <input type="text" name="nama_club" placeholder="Nama Club" value="<?= old('nama_club') ?>" required />
                    <input type="text" name="username" class="form-control <?php if (session('errors.username')) : ?>is-invalid<?php endif ?>" name="username" placeholder="<?= lang('Auth.username') ?>" value="<?= old('username') ?>" placeholder="Username" required />
                    <input type="email" name="email" placeholder="Email" value="<?= old('email') ?>" required />
                    <input type="password" name="password" placeholder="Masukkan Password" required />
                    <input type="password" name="pass_confirm" placeholder="Konfirmasi Password" required />
                    <input type="submit" name="" value="Sign Up" />
                    <p class="signup">
                        SUDAH PUNYA AKUN ?
                        <a href="#" onclick="toggleForm();">LOGIN</a>
                    </p>
                </form>
            </div>
            <div class="formRightImg m-auto text-center">
                <h4 class="imgBx text-secondary text-center align-middle my-auto mx-auto mb-2"><span>PERBASI</span>&nbsp;<p id="textWriterRight"></p>
                </h4>
                <img class="imgBx mx-auto" src="<?= BASE; ?>/img/perbasi.png" height="100" alt="" />
            </div>
            <!-- <div class="imgBx"><img class="gif" src="/img/perbasi.png" width="50%" alt="" /></div> -->
        </div>
    </div>
</section>
<footer class="text-secondary text-center footer m-2"><span style="font-size: 0.85em">PERBASI BANJARNEGARA &copy; 2023</span></footer>
<canvas class="background"></canvas>

<script src="/js/particles.min.js"></script>
<script>
    window.
    onload
        = function() {
            Particles.
            init
                ({
                    selector: '.background',
                    color: '#a9a9a9',
                    connectParticles: false,
                    sizeVariations: 5,
                    minDistance: 150
                });
        };


    // TypeWriter Effect
    var twl = document.getElementById('textWriterLeft');
    var twr = document.getElementById('textWriterRight');
    var typewriterL = new Typewriter(twl, {
        loop: true,
        autoStart: true
    });
    var typewriterR = new Typewriter(twr, {
        loop: true
    });


    typewriterL.typeString('BANJARNEGARA')
        .pauseFor(2500)
        .deleteAll()
        .typeString('JAWA TENGAH')
        .pauseFor(2500)
        .deleteAll()
        .typeString('INDONESIA')
        .pauseFor(2500)
        .deleteAll()
        .start();
    typewriterR.typeString('BANJARNEGARA')
        .pauseFor(2500)
        .deleteAll()
        .typeString('JAWA TENGAH')
        .pauseFor(2500)
        .deleteAll()
        .typeString('INDONESIA')
        .pauseFor(2500)
        .deleteAll()
        .start();
</script>
<?= $this->endSection(); ?>