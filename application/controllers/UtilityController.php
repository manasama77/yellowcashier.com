<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class UtilityController extends CI_Controller {

	public function loop_uuid($count)
	{
		$row = array();

		for($i=0; $i < $count; $i++){
			$id = $this->uuid->v4();
			echo $id.'<br>';
		}
		
	}

}

/* End of file UtilityController.php */
/* Location: ./application/controllers/UtilityController.php */