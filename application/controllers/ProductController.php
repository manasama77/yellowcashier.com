<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ProductController extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->library('TemplateAdmin', NULL, 'template');
		$this->load->model('M_product_less', 'mless');
	}

	public function index()
	{
		$data['title']   = 'List Produk';
		$data['content'] = 'product/index';
		$data['vitamin'] = 'product/index_vitamin';
		$this->template->template($data);
	}

	public function create()
	{
		$this->form_validation->set_rules('barcode', 'Barcode', 'required|trim');

		$this->form_validation->set_error_delimiters('<span class="help-block text-red">', '</span>');

		if ($this->form_validation->run() === FALSE) {
			$data['title']   = 'Tambah Produk';
			$data['content'] = 'product/form';
			$data['vitamin'] = 'product/form_vitamin';

			$data['arr_kategori'] = $this->mcore->get('category', '*', NULL, 'nama', 'ASC', NULL, NULL);
			$data['arr_satuan']   = $this->mcore->get('unit', '*', NULL, 'nama', 'ASC', NULL, NULL);
			$this->template->template($data);
		} else {
			$cur_date    = new DateTime('now');
			$id          = $this->uuid->v4();
			$barcode     = $this->input->post('barcode');
			$kode        = $this->input->post('kode');
			$nama        = $this->input->post('nama');
			$alias       = $this->input->post('alias');
			$id_kategori = $this->input->post('id_kategori');
			$id_satuan   = $this->input->post('id_satuan');
			$hpp         = $this->input->post('hpp') . ',' . $this->input->post('hpp_decimal');
			$hpj         = $this->input->post('hpj') . ',' . $this->input->post('hpj_decimal');
			$hpg         = $this->input->post('hpg') . ',' . $this->input->post('hpg_decimal');
			$margin_hpj  = $this->input->post('margin_hpj') . ',' . $this->input->post('margin_hpj_decimal');
			$margin_hpg  = $this->input->post('margin_hpg') . ',' . $this->input->post('margin_hpg_decimal');
			$qty         = '0,00';
			$foto        = $this->input->post('foto');
			$created_at  = $cur_date->format('Y-m-d H:i:s');
			$created_by  = $this->session->userdata(SESS . 'id');
			$updated_at  = $cur_date->format('Y-m-d H:i:s');
			$updated_by  = $this->session->userdata(SESS . 'id');
			$deleted_at  = NULL;
			$deleted_by  = NULL;

			$object = compact(
				'id',
				'barcode',
				'kode',
				'nama',
				'alias',
				'id_kategori',
				'id_satuan',
				'hpp',
				'hpj',
				'hpg',
				'margin_hpj',
				'margin_hpg',
				'qty',
				'foto',
				'created_at',
				'created_by',
				'updated_at',
				'updated_by',
				'deleted_at',
				'deleted_by'
			);
			$exec = $this->mcore->store('product', $object);

			if ($exec === TRUE) {
				$this->session->set_flashdata('success', TRUE);
			} else {
				$this->session->set_flashdata('error', TRUE);
			}

			redirect(site_url() . 'admin/product/create', 'refresh');
		}
	}

	public function kode_check($str)
	{
		$where = [
			'kode'       => $str,
			'deleted_at' => NULL
		];
		$arr = $this->mcore->get('product', '*', $where, NULL, 'ASC', NULL, NULL);

		if ($arr->num_rows() > 0) {
			$this->form_validation->set_message('kode_check', '{field} sama ditemukan, silahkan gunakan kode lain');
			return FALSE;
		} else {
			return TRUE;
		}
	}

	public function datatables()
	{
		$list = $this->mless->get_datatables();
		$data = array();
		$no   = $_POST['start'];
		foreach ($list as $field) {
			$no++;
			$row                  = array();
			$row['no']            = $no;
			$row['id']            = $field->id;
			$row['barcode']       = $field->barcode;
			$row['kode']          = $field->kode;
			$row['nama']          = $field->nama;
			$row['alias']         = $field->alias;
			$row['id_kategori']   = $field->id_kategori;
			$row['nama_kategori'] = $field->nama_kategori;
			$row['id_satuan']     = $field->id_satuan;
			$row['nama_satuan']   = $field->nama_satuan;
			$row['hpp']           = $field->hpp;
			$row['hpj']           = $field->hpj;
			$row['hpg']           = $field->hpg;
			$row['margin_hpj']    = $field->margin_hpj;
			$row['margin_hpg']    = $field->margin_hpg;
			$row['qty']           = $field->qty;
			$row['foto']          = $field->foto;
			$data[]               = $row;
		}

		$output = array(
			"draw"            => $_POST['draw'],
			"recordsTotal"    => $this->mless->count_all(),
			"recordsFiltered" => $this->mless->count_filtered(),
			"data"            => $data,
		);

		echo json_encode($output);
	}

	public function update()
	{
		$cur_date    = new DateTime('now');
		$id          = $this->input->post('id');
		$barcode     = $this->input->post('barcode');
		$kode        = $this->input->post('kode');
		$nama        = $this->input->post('nama');
		$alias       = $this->input->post('alias');
		$id_kategori = $this->input->post('id_kategori');
		$id_satuan   = $this->input->post('id_satuan');
		$hpp         = $this->input->post('hpp') . '.' . $this->input->post('hpp_decimal');
		$hpj         = $this->input->post('hpj') . '.' . $this->input->post('hpj_decimal');
		$hpg         = $this->input->post('hpg') . '.' . $this->input->post('hpg_decimal');
		$margin_hpj  = $this->input->post('margin_hpj') . '.' . $this->input->post('margin_hpj_decimal');
		$margin_hpg  = $this->input->post('margin_hpg') . '.' . $this->input->post('margin_hpg_decimal');
		$qty         = $this->input->post('qty');
		$foto        = $this->input->post('foto');
		$updated_at  = $cur_date->format('Y-m-d H:i:s');
		$updated_by  = $this->session->userdata(SESS . 'id');

		$object = compact(
			'barcode',
			'kode',
			'nama',
			'alias',
			'id_kategori',
			'id_satuan',
			'hpp',
			'hpj',
			'hpg',
			'margin_hpj',
			'margin_hpg',
			'qty',
			'foto',
			'updated_at',
			'updated_by'
		);
		$where  = ['id' => $id];
		$exec   = $this->mcore->update('product', $object, $where);

		if ($exec) {
			$ret = ['code' => 200];
		} else {
			$ret = ['code' => 500];
		}

		echo json_encode($ret);
	}

	public function destroy()
	{
		$cur_date = new DateTime('now');
		$id = $this->input->post('id');

		$object = [
			'deleted_at' => $cur_date->format('Y-m-d H:i:s'),
			'deleted_by' => $this->session->userdata(SESS . 'id'),
		];
		$where  = ['id' => $id];
		$exec   = $this->mcore->update('product', $object, $where);

		if ($exec) {
			$ret = ['code' => 200];
		} else {
			$ret = ['code' => 500];
		}

		echo json_encode($ret);
	}

	public function check_kode()
	{
		$barcode = $this->input->get('barcode');
		$kode    = $this->input->get('kode');
		$count   = $this->mless->check_kode($barcode, $kode);

		if ($count == 0) {
			$ret = ['code' => 200];
		} else {
			$ret = ['code' => 500];
		}

		echo json_encode($ret);
	}
}

/* End of file ProductController.php */
/* Location: ./application/controllers/ProductController.php */