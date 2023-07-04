<?php

namespace App\Controllers;

class Admin extends BaseController
{
    public function index()
    {
        $data = [
            'title' => 'Perbasi Banjarnegara',
            'id' => session()->get('logged_in'),
            'user' => session()->get('username')
        ];
        return view('admin/index', $data);
    }
}
