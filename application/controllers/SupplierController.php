<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class SupplierController extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('TemplateAdmin', NULL, 'template');
		$this->load->model('M_supplier_less', 'mless');
	}

	public function index()
	{
		$data['title']   = 'List Supplier';
		$data['content'] = 'supplier/index';
		$data['vitamin'] = 'supplier/index_vitamin';

		$data['arr_provinsi'] = $this->mcore->get('provinsi', '*', NULL, 'nama', 'ASC', NULL, NULL);
		$data['arr_bank']     = $this->mcore->get('bank', '*', NULL, 'nama', 'ASC', NULL, NULL);
		$this->template->template($data);
	}

	public function create()
	{
		$this->form_validation->set_rules('nama', 'Nama', 'required|trim');

		$this->form_validation->set_error_delimiters('<span class="help-block text-red">', '</span>');

		if ($this->form_validation->run() === FALSE) {
			$data['title']   = 'Tambah Supplier';
			$data['content'] = 'supplier/form';
			$data['vitamin'] = 'supplier/form_vitamin';

			$data['arr_provinsi'] = $this->mcore->get('provinsi', '*', NULL, 'nama', 'ASC', NULL, NULL);
			$data['arr_bank']     = $this->mcore->get('bank', '*', NULL, 'nama', 'ASC', NULL, NULL);

			$this->template->template($data);
		}else{
			$cur_date     = new DateTime('now');
			$id           = $this->uuid->v4();
			$kode         = $this->_generate_kode();
			$nama         = $this->input->post('nama');
			$alamat       = $this->input->post('alamat');
			$id_provinsi  = $this->input->post('id_provinsi');
			$id_kota      = $this->input->post('id_kota');
			$kodepos      = $this->input->post('kodepos');
			$no_telepon   = $this->input->post('no_telepon');
			$no_fax       = $this->input->post('no_fax');
			$email        = $this->input->post('email');
			$pic          = $this->input->post('pic');
			$no_handphone = $this->input->post('no_handphone');
			$id_bank      = $this->input->post('id_bank');
			$no_rekening  = $this->input->post('no_rekening');
			$atas_nama    = $this->input->post('atas_nama');
			$catatan      = $this->input->post('catatan');
			$created_at   = $cur_date->format('Y-m-d H:i:s');
			$created_by   = $this->session->userdata(SESS.'id');

			$object = compact(
				'id',
				'kode',
				'nama',
				'alamat',
				'id_provinsi',
				'id_kota',
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
				'created_at',
				'created_by'
			);
			$exec = $this->mcore->store('supplier', $object);

			if($exec === TRUE){
				$this->session->set_flashdata('success', TRUE);
				redirect(site_url().'admin/supplier/create','refresh');
			}else{
				$this->session->set_flashdata('error', TRUE);
				redirect(site_url().'admin/supplier/create','refresh');
			}
		}

	}

	public function kode_check($str)
	{
		$where = ['kode' => $str];
		$count = $this->mcore->count('supplier', $where);

		if ($count > 0) {
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
			$row['kode']          = $field->kode;
			$row['nama']          = $field->nama;
			$row['alamat']        = $field->alamat;
			$row['id_provinsi']   = $field->id_provinsi;
			$row['nama_provinsi'] = $field->nama_provinsi;
			$row['id_kota']       = $field->id_kota;
			$row['nama_kota']     = $field->nama_kota;
			$row['kodepos']       = $field->kodepos;
			$row['no_telepon']    = $field->no_telepon;
			$row['no_fax']        = $field->no_fax;
			$row['email']         = $field->email;
			$row['pic']           = $field->pic;
			$row['no_handphone']  = $field->no_handphone;
			$row['id_bank']       = $field->id_bank;
			$row['nama_bank']     = $field->nama_bank;
			$row['no_rekening']   = $field->no_rekening;
			$row['atas_nama']     = $field->atas_nama;
			$row['catatan']       = $field->catatan;
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
		$cur_date     = new DateTime('now');
		$id           = $this->input->post('edit_id');
		$nama         = $this->input->post('edit_nama');
		$alamat       = $this->input->post('edit_alamat');
		$id_provinsi  = $this->input->post('edit_id_provinsi');
		$id_kota      = $this->input->post('edit_id_kota');
		$kodepos      = $this->input->post('edit_kodepos');
		$no_telepon   = $this->input->post('edit_no_telepon');
		$no_fax       = $this->input->post('edit_no_fax');
		$email        = $this->input->post('edit_email');
		$pic          = $this->input->post('edit_pic');
		$no_handphone = $this->input->post('edit_no_handphone');
		$id_bank      = $this->input->post('edit_id_bank');
		$no_rekening  = $this->input->post('edit_no_rekening');
		$atas_nama    = $this->input->post('edit_atas_nama');
		$catatan      = $this->input->post('edit_catatan');

		$object = compact(
			'nama',
			'alamat',
			'id_provinsi',
			'id_kota',
			'kodepos',
			'no_telepon',
			'no_fax',
			'email',
			'pic',
			'no_handphone',
			'id_bank',
			'no_rekening',
			'atas_nama',
			'catatan'
		);
		$where  = ['id' => $id];
		$exec   = $this->mcore->update('supplier', $object, $where);

		if($exec){
			$ret = ['code' => 200];
		}else{
			$ret = ['code' => 500];
		}

		echo json_encode($ret);
	}

	public function destroy()
	{
		$id    = $this->input->post('id');
		$where = ['id' => $id];
		$exec  = $this->mcore->delete('supplier', $where);

		if($exec){
			$ret = ['code' => 200];
		}else{
			$ret = ['code' => 500];
		}

		echo json_encode($ret);
	}

	public function get_list_kota()
	{
		$id_provinsi = $this->input->get('id_provinsi');
		$where       = ['id_provinsi' => $id_provinsi];
		$arr         = $this->mcore->get('kota', '*', $where, 'nama', 'ASC', NULL, NULL);

		if($arr->num_rows() > 0){
			$data = [];
			foreach ($arr->result() as $key) {
				$data[] = ['id' => $key->id, 'nama' => $key->nama];
			}
			$ret = ['code' => 200, 'data' => $data];
		}else{
			$ret = ['code' => 500];
		}

		echo json_encode($ret);
	}

	public function _generate_kode()
	{
		$arr = $this->mcore->get('supplier', 'kode', NULL, 'kode', 'DESC', 1, NULL);

		$a = explode('V', $arr->row()->kode);

		if($arr->num_rows() == 0){
			$seq = 1;
		}else{
			$seq = $a[1] + 1;
		}

		$kode = $seq;

		if($seq < 10){
			$kode = 'V000'.$seq;
		}elseif($seq < 100){
			$kode = 'V00'.$seq;
		}elseif($seq < 1000){
			$kode = 'V0'.$seq;
		}

		return $kode;

	}

}

/* End of file SupplierController.php */
/* Location: ./application/controllers/SupplierController.php */