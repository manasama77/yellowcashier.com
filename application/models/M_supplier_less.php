<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_supplier_less extends CI_Model {

	var $table = 'supplier';
	var $column_order = array(
		'id',
		'kode',
		'nama',
		'alamat',
		'nama_provinsi',
		'nama_kota',
		'kodepos',
		'no_telepon',
		'no_fax',
		'email',
		'pic',
		'no_handphone',
		'id_bank',
		'no_rekening',
		'atas_nama',
		'catatan',
	);
	var $column_search = array(
		'kode',
		'nama',
		'alamat',
		'nama_provinsi',
		'nama_kota',
		'kodepos',
		'no_telepon',
		'no_fax',
		'email',
		'pic',
		'no_handphone',
		'id_bank',
		'no_rekening',
		'atas_nama',
		'catatan',
	);
	var $order = array('kode' => 'asc');

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	private function _get_datatables_query()
	{

		$this->db->select('
			'.$this->table.'.id,
			'.$this->table.'.kode,
			'.$this->table.'.nama,
			'.$this->table.'.alamat,
			'.$this->table.'.id_provinsi,
			provinsi.nama as nama_provinsi,
			'.$this->table.'.id_kota,
			kota.nama as nama_kota,
			'.$this->table.'.kodepos,
			'.$this->table.'.no_telepon,
			'.$this->table.'.no_fax,
			'.$this->table.'.email,
			'.$this->table.'.pic,
			'.$this->table.'.no_handphone,
			'.$this->table.'.id_bank,
			bank.nama as nama_bank,
			'.$this->table.'.no_rekening,
			'.$this->table.'.atas_nama,
			'.$this->table.'.catatan,
		');
		$this->db->from($this->table);
		$this->db->join('provinsi', 'provinsi.id = '.$this->table.'.id_provinsi', 'left');
		$this->db->join('kota', 'kota.id = '.$this->table.'.id_kota', 'left');
		$this->db->join('bank', 'bank.id = '.$this->table.'.id_bank', 'left');

		$i = 0;

		foreach ($this->column_search as $item)
		{
			if($_POST['search']['value'])
			{
				if($i===0)
				{
					$this->db->group_start(); 
					$this->db->like($item, $_POST['search']['value']);
				}
				else
				{
					$this->db->or_like($item, $_POST['search']['value']);
				}

				if(count($this->column_search) - 1 == $i) 
					$this->db->group_end(); 
			}
			$i++;
		}

		if(isset($_POST['order'])) 
		{
			$this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
		} 
		else if(isset($this->order))
		{
			$order = $this->order;
			$this->db->order_by(key($order), $order[key($order)]);
		}
	}

	function get_datatables()
	{
		$this->_get_datatables_query();
		if($_POST['length'] != -1)
			$this->db->limit($_POST['length'], $_POST['start']);
		$query = $this->db->get();
		return $query->result();
	}

	function count_filtered()
	{
		$this->_get_datatables_query();
		$query = $this->db->get();
		return $query->num_rows();
	}

	public function count_all()
	{
		$this->db->from($this->table);
		return $this->db->count_all_results();
	}

}

/* End of file M_supplier_less.php */
/* Location: ./application/models/M_supplier_less.php */