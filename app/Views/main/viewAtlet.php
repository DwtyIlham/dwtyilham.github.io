    <?php

    use function App\Controllers\tgl_indo;

    echo $this->extend('template/template');
    echo $this->section('content');

    if (session()->getFlashdata('success')) : ?>
        <div style='position: fixed; top: 10px; right: 10px; width: 30%; background-color: #f0f0f0; padding: 10px; border: 1px solid #ccc;' class="alert alert-success">
            <?= session()->getFlashdata('success') ?>
        </div>
    <?php endif; ?>

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
    <div class="container-fluid">
        <?= view('Myth\Auth\Views\_message_block') ?>
        <div class="mt-2 px-3 row card">
            <div class="card-body">
                <div class="input-group">
                    <button onclick="window.location.href = '<?= base_url(); ?>home/atlet'" class="btn btn-secondary"><i class="fa fa-arrow-left"></i></button>
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <h4 class="my-auto">Data Atlet Club</h4>
                        </span>
                    </div>
                </div>

                <div class="table-responsive" style="overflow-x: auto;">
                    <table id="tabel-data" class="mt-3 table table-sm table-bordered table-responsive">
                        <thead>
                            <tr class="text-center">
                                <th>No.</th>
                                <th>NIK</th>
                                <th>Nama</th>
                                <th>TTL</th>
                                <th>Sekolah</th>
                                <th>L/P</th>
                                <th>No. HP/WA</th>
                                <th>Akun IG</th>
                                <th>Foto</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1 + ($jmlData * ($currentPage - 1));
                            if (COUNT($atlet) > 0) :
                                foreach ($atlet as $a) :
                            ?>
                                    <tr class="align-middle">
                                        <td class="text-center"><?= $no; ?>.</td>
                                        <td><?= $a['nik']; ?></td>
                                        <td><?= $a['nama']; ?></td>
                                        <td><?= $a['tempat_lahir'] . ', ' . tgl_indo($a['tanggal_lahir']); ?></td>
                                        <td><?= $a['asal_sekolah']; ?></td>
                                        <td class="text-center"><?= $a['jk']; ?></td>
                                        <td><?= $a['no_hp']; ?></td>
                                        <td>
                                            <img class="socmed-ig" src="/img/ig.svg" alt="">
                                            <a href="http://www.instagram.com/<?= $a['akun_ig']; ?>" target="_blank">
                                                @<?= $a['akun_ig']; ?>
                                            </a>
                                        </td>
                                        <td class="text-center"><img class="foto" src="<?= BASE . 'user-doc/foto_atlet/' . $a['file_foto']; ?>"></td>
                                    </tr>
                            <?php $no++;
                                endforeach;
                            else : echo '<tr><td colspan="9" class="text-center">Belum Ada Data</td></tr>';
                            endif; ?>
                        </tbody>
                    </table>
                    <?= $pager->links('pendataan_atlet', 'view_pagination'); ?>
                </div>
            </div>
        </div>
    </div>
    <?= $this->endSection(); ?>