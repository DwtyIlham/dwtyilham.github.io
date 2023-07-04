<?= $this->extend('template/template'); ?>
<?= $this->section('content'); ?>

<body id="main">
    <?php if (session()->getFlashdata('success')) : ?>
        <div style='position: fixed; top: 10px; right: 10px; width: 30%; background-color: #f0f0f0; padding: 10px; border: 1px solid #ccc;' class="alert alert-success">
            <?= session()->getFlashdata('success') ?>
        </div>
    <?php endif; ?>

    <?php if (session()->getFlashdata('error')) : ?>
        <div class="alert alert-danger">
            <?= session()->getFlashdata('error') ?>
        </div>
    <?php endif; ?>

    <div class="container-fluid">
        <?= view('Myth\Auth\Views\_message_block') ?>
        <div class="mt-2 px-3 row card">
            <div class="card-body">
                <?php
                if (session()->getFlashdata('input-sukses')) : ?>
                    <div class="message alert alert-success">
                        <?= session()->getFlashdata('input-sukses') ?>
                    </div>
                <?php endif; ?>
                <?php if (session()->getFlashdata('input-gagal')) : ?>
                    <div class="alert alert-danger">
                        <?= session()->getFlashdata('input-gagal') ?>
                    </div>
                <?php endif; ?>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="input-group">
                            <button onclick="window.location.href = '<?= base_url(); ?>'" class="btn btn-secondary"><i class="fa fa-arrow-left"></i></button>
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <h4 class="my-auto">Pendataan Atlet Club</h4>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 text-lg-end">
                        <a href="<?= base_url('home/viewAtlet/' . base64_encode($id)); ?>" class="btn btn-primary"><i class="fa fa-list"></i> Lihat Data Atlet</a>
                    </div>
                </div>
            </div>

            <?= form_open_multipart(base_url('home/inputAtlet')); ?>
            <table id="tabel-data" class="table table-sm mt-3">
                <?php $no = 1; ?>
                <tbody>
                    <input type="hidden" name="id_club" value="<?= session()->get('logged_in'); ?>">
                    <tr class="align-middle">
                        <td>NIK</td>
                        <td> : </td>
                        <td><input type="text" minlength="16" maxlength="16" name="nik" class="form-control" placeholder="NIK"></td>
                    </tr>
                    <tr class="align-middle">
                        <td>Nama Lengkap</td>
                        <td> : </td>
                        <td><input type="text" name="nama" class="form-control" placeholder="Nama Lengkap"></td>
                    </tr>
                    <tr class="align-middle">
                        <td>Jenis Kelamin</td>
                        <td> : </td>
                        <td>
                            <select name="jk" class="form-control">
                                <option value="" selected disabled>Pilih Jenis Kelamin</option>
                                <option value="L">Laki-Laki</option>
                                <option value="P">Perempuan</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="align-middle">
                        <td>Tempat Lahir</td>
                        <td> : </td>
                        <td><input type="text" name="tempat_lahir" class="form-control" placeholder="Tempat Lahir"></td>
                    </tr>
                    <tr class="align-middle">
                        <td>Tanggal Lahir</td>
                        <td> : </td>
                        <td><input type="date" name="tanggal_lahir" class="form-control" placeholder="Tanggal Lahir"></td>
                    </tr>
                    <tr class="align-middle">
                        <td>Asal Sekolah</td>
                        <td> : </td>
                        <td><input type="text" name="asal_sekolah" class="form-control" placeholder="Asal Sekolah"></td>
                    </tr>
                    <tr class="align-middle">
                        <td>Kelas / Tingkat</td>
                        <td> : </td>
                        <td><select class="selectKelas form-control" name="tingkat" id="">
                                <option value="" selected disabled>Pilih Kelas</option>
                                <?php for ($x = 0; $x < 12; $x++) : ?>
                                    <option value="<?= $x + 1; ?>"><?= $x + 1; ?></option>
                                <?php endfor; ?>
                            </select></td>
                    </tr>
                    <tr class="align-middle">
                        <td>No. HP (WA)</td>
                        <td> : </td>
                        <td><input type="text" name="no_hp" class="form-control" placeholder="No. HP (WA)"></td>
                    </tr>
                    <tr class="align-middle">
                        <td>Akun IG</td>
                        <td> : </td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-text">@</span>
                                <input type="text" name="akun_ig" class="form-control" placeholder="Akun IG">
                            </div>
                        </td>
                    </tr>
                    <tr class="align-middle">
                        <td>Upload Foto</td>
                        <td> : </td>
                        <td><input class="form-control" type="file" name="file_foto" accept="image/jpeg"></td>
                    </tr>
                </tbody>
            </table>
            <div class="row mb-3">
                <div class="col-md">
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </div>
            <?= form_close(); ?>
        </div>
    </div>
    </div>
</body>
<?= $this->endSection(); ?>