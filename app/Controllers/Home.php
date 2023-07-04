<?php

namespace App\Controllers;

use App\Models\PendataanOfficialModel;
use App\Models\PendataanAtletModel;
use CodeIgniter\Controller;

class Home extends BaseController
{
    protected $model;
    protected $modelAtlet;
    protected $user;
    public function __construct()
    {
        $db = db_connect();
        $this->model = new PendataanOfficialModel($db);
        $this->modelAtlet = new PendataanAtletModel($db);
        $this->user = ucwords(session()->get('username'));

        function tgl_indo($dateString)
        {
            // Create DateTime object from the input date string
            $date = \DateTime::createFromFormat('Y-m-d', $dateString);

            // Get the day, month, and year from the DateTime object
            $day = $date->format('d');
            $month = $date->format('m');
            $year = $date->format('Y');

            // Define Indonesian month names
            $monthNames = [
                1 => 'Januari',
                2 => 'Februari',
                3 => 'Maret',
                4 => 'April',
                5 => 'Mei',
                6 => 'Juni',
                7 => 'Juli',
                8 => 'Agustus',
                9 => 'September',
                10 => 'Oktober',
                11 => 'November',
                12 => 'Desember'
            ];

            // Create the Indonesian date format
            $indonesianDate = $day . ' ' . $monthNames[(int)$month] . ' ' . $year;

            return $indonesianDate;
        }
    }

    public function index()
    {
        $data = [
            'title' => 'Perbasi Banjarnegara',
            'id' => session()->get('logged_in'),
            'user' => session()->get('username')
        ];
        return view('main/regIndex', $data);
    }

    public function atlet()
    {
        $data = [
            'title' => 'Pendataan Atlet',
            'id' => session()->get('logged_in'),
            'user' => session()->get('username')
        ];
        return view('main/regAtlet', $data);
    }

    public function official()
    {
        $data = [
            'title' => 'Pendataan Official',
            'id' => session()->get('logged_in'),
            'user' => session()->get('username')
        ];
        return view('main/regOfficial', $data);
    }

    public function inputOfficial()
    {
        $data = $_POST;

        // Retrieve the uploaded file
        $file = $this->request->getFile('file_foto');

        if ($file->isValid() && !$file->hasMoved()) {
            // Move the uploaded file to a desired location
            $newName = $data['nik'] . '_' . date('H-i-s') . '.jpeg';
            $file->move(FCPATH . 'user-doc/foto_official', $newName);

            // Insert the file name into the database
            $data['file_foto'] = $newName;
            $this->model->add($data);

            // Redirect or display success message
            $session = session();
            $session->setFlashdata('input-sukses', 'Data Tersimpan.');
            return redirect()->to('home/official');
        } else {
            // Handle the file upload error
            return redirect()->back()->with('error', 'File upload failed.');
        }
    }

    public function inputAtlet()
    {
        $data = $_POST;

        // Retrieve the uploaded file
        $file = $this->request->getFile('file_foto');

        if ($file->isValid() && !$file->hasMoved()) {
            // Move the uploaded file to a desired location
            $newName = $data['nik'] . '_' . date('H-i-s') . '.jpeg';
            $file->move(FCPATH . 'user-doc/foto_atlet', $newName);

            // Insert the file name into the database
            $data['file_foto'] = $newName;
            $this->modelAtlet->add($data);

            // Redirect or display success message
            $session = session();
            $session->setFlashdata('input-sukses', 'Data Tersimpan.');
            return redirect()->to('home/atlet');
        } else {
            // Handle the file upload error
            return redirect()->back()->with('error', 'File upload failed.');
        }
    }

    public function viewOfficial($id)
    {
        $id = base64_decode($id);
        $jmlDataPerPage = 5;
        $currentPage = $this->request->getVar('page_pendataan_official') ? $this->request->getVar('page_pendataan_official') : 1;
        $data = [
            'title' => 'Pendataan Official',
            'user'  => $this->user,
            // 'data'  => $this->model->getOfficial($id),
            'data'         => $this->model->paginate($jmlDataPerPage, 'pendataan_official'),
            'pager'         => $this->model->pager,
            'user'          => $this->user,
            'currentPage'   => $currentPage,
            'jmlData'       => $jmlDataPerPage
        ];
        return view('main/viewOfficial', $data);
    }

    public function viewAtlet($id)
    {
        $id = base64_decode($id);
        $jmlDataPerPage = 5;
        $currentPage = $this->request->getVar('page_pendataan_atlet') ? $this->request->getVar('page_pendataan_atlet') : 1;
        $data = [
            'title'         => 'Data Atlet ' . $this->user,
            // 'atlet' => $this->modelAtlet->getAtlet($id)
            'atlet'         => $this->modelAtlet->paginate($jmlDataPerPage, 'pendataan_atlet'),
            'pager'         => $this->modelAtlet->pager,
            'user'          => $this->user,
            'currentPage'   => $currentPage,
            'jmlData'       => $jmlDataPerPage
        ];
        return view('main/viewAtlet', $data);
    }
}
