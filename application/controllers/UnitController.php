<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class UnitController extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('TemplateAdmin', NULL, 'template');
		$this->load->model('M_unit_less', 'mless');
	}

	public function index()
	{
		$data['title']   = 'List Satuan';
		$data['content'] = 'unit/index';
		$data['vitamin'] = 'unit/index_vitamin';
		$this->template->template($data);
	}

	public function datatables()
	{
		$list = $this->mless->get_datatables();
		$data = array();
		$no   = $_POST['start'];
		foreach ($list as $field) {
			$no++;
			$row             = array();
			$row['no']       = $no;
			$row['id']       = $field->id;
			$row['nama']     = $field->nama;
			$data[]          = $row;
		}

		$output = array(
			"draw"            => $_POST['draw'],
			"recordsTotal"    => $this->mless->count_all(),
			"recordsFiltered" => $this->mless->count_filtered(),
			"data"            => $data,
		);

		echo json_encode($output);
	}

	public function store()
	{
		$id   = $this->uuid->v4();
		$nama = $this->input->post('nama');

		$where = ['nama' => $nama];
		$count = $this->mcore->count('unit', $where);

		if($count > 0){
			echo json_encode(['code' => '400']);
			exit;
		}

		$object = [
			'id'   => $id,
			'nama' => $nama
		];
		$exec   = $this->mcore->store('unit', $object);

		if($exec){
			$ret = ['code' => 200];
		}else{
			$ret = ['code' => 500];
		}

		echo json_encode($ret);
	}

	public function update()
	{
		$cur_date = new DateTime('now');
		$id       = $this->input->post('id');
		$nama     = $this->input->post('nama');

		$object = ['nama' => $nama];
		$where  = ['id' => $id];
		$exec   = $this->mcore->update('unit', $object, $where);

		if($exec){
			$ret = ['code' => 200];
		}else{
			$ret = ['code' => 500];
		}

		echo json_encode($ret);
	}

	public function destroy()
	{
		$id       = $this->input->post('id');

		$where  = ['id' => $id];
		$exec   = $this->mcore->delete('unit', $where);

		if($exec){
			$ret = ['code' => 200];
		}else{
			$ret = ['code' => 500];
		}

		echo json_encode($ret);
	}

}

/* End of file UnitController.php */
/* Location: ./application/controllers/UnitController.php */