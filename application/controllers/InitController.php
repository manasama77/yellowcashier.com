<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class InitController extends CI_Controller {

	public function init_admin()
	{
		$now            = new DateTime();
		$id_admin       = $this->uuid->v4();
		$password_admin = password_hash('admin'.UYAH, PASSWORD_DEFAULT);
		$id_kasir       = $this->uuid->v4();
		$password_kasir = password_hash('kasir'.UYAH, PASSWORD_DEFAULT);

		# INIT ROLE
		##################################################################
		$data_admin[0] = [
			'id'         => $id_admin,
			'username'   => 'admin',
			'password'   => $password_admin,
			'nama'       => 'Admin',
			'role'       => 'master',
			'created_at' => $now->format('Y-m-d H:i:s'),
			'updated_at' => $now->format('Y-m-d H:i:s'),
			'deleted_at' => NULL
		];

		$data_admin[1] = [
			'id'         => $id_kasir,
			'username'   => 'kasir',
			'password'   => $password_kasir,
			'nama'       => 'Kasir Dummy',
			'role'       => 'kasir',
			'created_at' => $now->format('Y-m-d H:i:s'),
			'updated_at' => $now->format('Y-m-d H:i:s'),
			'deleted_at' => NULL
		];

		$exec = $this->mcore->store_batch('admin', $data_admin);
		##################################################################
	}

}

/* End of file InitController.php */
/* Location: ./application/controllers/InitController.php */