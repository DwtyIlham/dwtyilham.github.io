<?php

namespace App\Models;

use CodeIgniter\Model;
// use CodeIgniter\Database\ConnectionInterface;

$pager = \Config\Services::pager();

class PendataanAtletModel extends Model
{

    protected $db;
    protected $table = 'pendataan_atlet';
    protected $allowedFields = ['file_foto'];

    // public function __construct(ConnectionInterface &$db)
    // {
    //     $this->db = &$db;
    // }

    function getAtlet($id)
    {
        $query = $this->db->table($this->table)->where('id_club', $id)->get();
        return $query->getResultArray();
    }

    function add($data)
    {
        return $this->db
            ->table($this->table)
            ->insert($data);
    }
}
