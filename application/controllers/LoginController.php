<?php
defined('BASEPATH') or exit('No direct script access allowed');

class LoginController extends CI_Controller
{
	private $cookies_name = 'yellowcashier';

	public function __construct()
	{
		parent::__construct();
		$this->load->helper(['cookie', 'string']);
	}

	public function index()
	{
		$cookies = get_cookie($this->cookies_name);

		if ($cookies != NULL) {
			$check_cookies = $this->mcore->get('admin', '*', ['cookies' => $cookies], NULL, 'ASC', NULL, NULL);

			if ($check_cookies->num_rows() == 1) {
				$id       = $check_cookies->row()->id;
				$username = $check_cookies->row()->username;
				$nama     = $check_cookies->row()->nama;
				$role     = $check_cookies->row()->role;

				$this->_set_session($id, $username, $nama, $role);

				if ($role == 'master') {
					redirect(base_url() . 'login_as', 'refresh');
				} elseif ($role == 'admin') {
					redirect(base_url() . 'admin/dashboard', 'refresh');
				} else {
					redirect(base_url() . 'kasir/index', 'refresh');
				}
			} else {
				delete_cookie($this->cookies_name);
				redirect(site_url(), 'refresh');
			}
		} else {
			$this->form_validation->set_rules('username', 'Username', 'callback_username_check');
			$this->form_validation->set_rules('password', 'Password', 'callback_password_check');

			if ($this->form_validation->run() === FALSE) {
				$this->load->view('login/index');
			} else {
				$username = $this->input->post('username');
				$where = [
					'username'   => $username,
					'deleted_at' => NULL
				];
				$arr      = $this->mcore->get('admin', '*', $where, NULL, 'ASC', NULL, NULL);

				$id       = $arr->row()->id;
				$username = $arr->row()->username;
				$nama     = $arr->row()->nama;
				$role     = $arr->row()->role;

				$this->_set_session($id, $username, $nama, $role);

				$remember = $this->input->post('remember');
				if ($remember == 'on') {
					$key_cookies = random_string('alnum', 64);
					set_cookie($this->cookies_name, $key_cookies, 3600 * 24 * 30);
					$this->mcore->update('admin', ['cookies' => $key_cookies, 'remember' => '1'], ['id' => $id]);
				}

				if ($role == 'master') {
					redirect(base_url() . 'login_as', 'refresh');
				} elseif ($role == 'admin') {
					redirect(base_url() . 'admin/dashboard', 'refresh');
				} else {
					redirect(base_url() . 'kasir/index', 'refresh');
				}
			}
		}
	}

	public function username_check($str)
	{
		$where = [
			'username'   => $str,
			'deleted_at' => NULL
		];
		$arr = $this->mcore->get('admin', '*', $where, NULL, 'ASC', NULL, NULL);

		if ($arr->num_rows() == 0) {
			$this->form_validation->set_message('username_check', '{field} Tidak ditemukan');
			return FALSE;
		} else {
			return TRUE;
		}
	}

	public function password_check($str)
	{
		$username = $this->input->post('username');
		$where = [
			'username'   => $username,
			'deleted_at' => NULL
		];
		$arr = $this->mcore->get('admin', '*', $where, NULL, 'ASC', NULL, NULL);

		if (password_verify($str . UYAH, $arr->row()->password) === FALSE) {
			$this->form_validation->set_message('password_check', '{field} Salah, silahkan cek kembali');
			return FALSE;
		} else {
			return TRUE;
		}
	}

	public function _set_session($id, $username, $nama, $role)
	{
		$this->session->set_userdata(SESS . 'id', $id);
		$this->session->set_userdata(SESS . 'username', $username);
		$this->session->set_userdata(SESS . 'nama', $nama);
		$this->session->set_userdata(SESS . 'role', $role);
	}

	public function logout()
	{
		delete_cookie($this->cookies_name);
		$this->session->unset_userdata(SESS . 'id');
		$this->session->unset_userdata(SESS . 'username');
		$this->session->unset_userdata(SESS . 'nama');
		$this->session->unset_userdata(SESS . 'role');
		redirect(site_url(), 'refresh');
	}

	public function login_as()
	{
		$id       = $this->session->userdata(SESS . 'id');
		$username = $this->session->userdata(SESS . 'username');
		$nama     = $this->session->userdata(SESS . 'nama');
		$role     = $this->session->userdata(SESS . 'role');

		$where = [
			'id'       => $id,
			'username' => $username,
			'nama'     => $nama,
			'role'     => $role,
		];
		$count = $this->mcore->count('admin', $where);

		if ($count == 0) {
			redirect(site_url() . 'logout', 'refresh');
		} else {
			$this->load->view('login/as');
		}
	}
}

/* End of file LoginController.php */
/* Location: ./application/controllers/LoginController.php */