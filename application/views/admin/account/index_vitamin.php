<link rel="stylesheet" href="<?=base_url();?>vendor/datatables/datatables.min.css">
<script src="<?=base_url();?>vendor/datatables/datatables.min.js"></script>
<script>
	$(document).ready(function(){
		table = $('#datatables').DataTable({
			"destroy": true,
			"responsive": true,
			"processing": true, 
			"serverSide": true, 
			"order": [], 
			"ajax": {
				"url": `<?=site_url('datatables/datatables_account')?>`,
				"type": "POST"
			},
			"columns": [
				{ "data": "username" },
				{ "data": "nama" },
				{
					"data": null,
					"render": function(res){
						if(res.role == 'master'){
							return `<div class="text-center"><span class="label label-primary">Master</span></div>`;
						}else if(res.role == 'admin'){
							return `<div class="text-center"><span class="label label-info">Admin</span></div>`;
						}else{
							return `<div class="text-center"><span class="label label-warning">Kasir</span></div>`;
						}
					}
				},
				{ 
					"data": null,
					"render": function(res){
						html = `
						<div class="text-center">
							<div class="btn-group">
								<button class="btn btn-info btn-xs" onclick="editData('${res.id}', '${res.username}', '${res.nama}', '${res.role}')"><i class="fa fa-pencil fa-fw"></i> Edit</button>
								<button class="btn btn-danger btn-xs" onclick="deleteData('${res.id}');"><i class="fa fa-trash fa-fw"></i> Delete</button>
								<button class="btn btn-warning btn-xs" onclick="resetPassword('${res.id}', '${res.username}');"><i class="fa fa-key fa-fw"></i> Reset Password</button>
							</div>
						</div>
						`;
						return html;
					}
				},
			],
			"columnDefs": [
			{ 
				"targets": [3],
				"orderable": false,
			},
			],
		});

		$('#form_edit').on('submit', function(e){
			e.preventDefault();

			$.ajax({
				url: `<?=site_url();?>admin/account/update`,
				method: 'post',
				dataType: 'json',
				data: {
					id: $('#edit_id').val(),
					nama: $('#edit_nama').val(),
					role: $('#edit_role').val(),
				},
				beforeSend: function(){
					$('#edit_submit').attr('disabled', true);
					$.blockUI();
				}
			}).done(function(res){
				if(res.code == 200){
					alert('Update Akun Berhasil');
					$('#edit_id').val(null);
					$('#edit_username').val(null);
					$('#edit_username_text').val(null);
					$('#modal-edit').modal('hide');
					table.draw();
				}else{
					alert('Edit Akun Gagal');
				}
				$('#edit_submit').attr('disabled', false);
				$.unblockUI();
			});
		});

		$('#form_reset').on('submit', function(e){
			e.preventDefault();

			$.ajax({
				url: `<?=site_url();?>admin/account/reset`,
				method: 'post',
				dataType: 'json',
				data: {
					id: $('#reset_id').val(),
					password: $('#reset_password').val()
				},
				beforeSend: function(){
					$('#reset_submit').attr('disabled', true);
					$.blockUI();
				}
			}).done(function(res){
				if(res.code == 200){
					alert('Reset Akun Berhasil');
					$('#reset_id').val(null);
					$('#reset_username').val(null);
					$('#reset_username_text').val(null);
					$('#modal-reset').modal('hide');
					table.draw();
				}else{
					alert('Reset Akun Gagal');
				}
				$('#reset_submit').attr('disabled', false);
				$.unblockUI();
			});
		});

	});

	function editData(id, username, nama, role)
	{
		$('#edit_id').val(id);
		$('#edit_username').val(username);
		$('#edit_nama').val(nama);
		$('#edit_role').val(role);
		$('#modal-edit').modal('show');
		$('#edit_nama').focus();
	}

	function deleteData(id)
	{
		let c = confirm('Hapus Akun ?');

		if(c == true){
			$.ajax({
				url: `<?=site_url();?>admin/account/destroy`,
				method: 'post',
				data: { id: id },
				dataType: 'json',
				beforeSend: function(){
					$.blockUI();
				}
			})
			.done(function(res){
				if(res.code == 200){
					alert('Hapus Akun Berhasil');
					table.draw();
				}else{
					alert('Hapus Akun Gagal');
				}
				$.unblockUI();

			});
		}
	}

	function resetPassword(id, username)
	{
		$('#reset_id').val(id);
		$('#reset_username').val(username);
		$('#reset_username_text').val(username);
		$('#modal-reset').modal('show');

	}
</script>