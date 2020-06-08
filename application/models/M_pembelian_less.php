<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_pembelian_less extends CI_Model {

	var $table = 'product';
	var $column_order = array(
		'product.id',
		'product.barcode',
		'product.kode',
		'product.nama',
		'product.alias',
		'product.id_kategori',
		'nama_kategori',
		'product.id_satuan',
		'nama_satuan',
		'product.hpp',
		'product.hpj',
		'product.hpg',
		'product.margin_hpj',
		'product.margin_hpg',
		'product.qty',
		'product.foto'
	);
	var $column_search = array(
		'product.barcode',
		'product.kode',
		'product.nama',
		'product.alias',
		'product.id_kategori',
		'category.nama',
		'product.id_satuan',
		'unit.nama',
		'product.hpp',
		'product.hpj',
		'product.hpg',
		'product.margin_hpj',
		'product.margin_hpg',
		'product.qty'
	);
	var $order = array('product.kode' => 'asc');

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	private function _get_datatables_query()
	{

		$this->db->select('
			'.$this->table.'.id,
			'.$this->table.'.barcode,
			'.$this->table.'.kode,
			'.$this->table.'.nama,
			'.$this->table.'.alias,
			'.$this->table.'.id_kategori,
			category.nama as nama_kategori,
			'.$this->table.'.id_satuan,
			unit.nama as nama_satuan,
			'.$this->table.'.hpp,
			'.$this->table.'.hpj,
			'.$this->table.'.hpg,
			'.$this->table.'.margin_hpj,
			'.$this->table.'.margin_hpg,
			'.$this->table.'.qty,
			'.$this->table.'.foto
		');
		$this->db->from($this->table);
		$this->db->join('category', 'category.id = '.$this->table.'.id_kategori', 'left');
		$this->db->join('unit', 'unit.id = '.$this->table.'.id_satuan', 'left');

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
		$this->db->where($this->table.'.deleted_at', NULL);
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

	public function check_kode($barcode, $kode)
	{
		$this->db->where('barcode', $barcode);
		$this->db->or_where('kode', $kode);
		$this->db->from('product');
		return $this->db->count_all_results();
	}

}

/* End of file M_pembelian_less.php */
/* Location: ./application/models/M_pembelian_less.php */