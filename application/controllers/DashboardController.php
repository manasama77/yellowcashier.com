<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class DashboardController extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('TemplateAdmin', NULL, 'template');
	}

	public function index()
	{
		$data['title']   = 'Dashboard';
		$data['content'] = 'dashboard/index';
		$data['vitamin'] = 'dashboard/index_vitamin';

		$data['admin_count'] = $this->mcore->count('admin', ['role' => 'admin', 'deleted_at' => NULL]);
		$data['kasir_count'] = $this->mcore->count('admin', ['role' => 'kasir', 'deleted_at' => NULL]);

		$this->template->template($data);
	}

}

/* End of file DashboardController.php */
/* Location: ./application/controllers/DashboardController.php */