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
				"url": `<?=site_url('datatables/datatables_product')?>`,
				"type": "POST"
			},
			"columns": [
				{ "data": "kode" },
				{ "data": "nama" },
				{ "data": "alias" },
				{ "data": "nama_kategori" },
				{ "data": "nama_satuan" },
				{ "data": "hpp" },
				{ "data": "hpj" },
				{ "data": "hpg" },
				{ "data": "margin_hpj" },
				{ "data": "margin_hpg" },
				{ "data": "qty" },
				{ 
					"data": null,
					"render": function(res){
						html = `
						<div class="text-center">
							<div class="btn-group">
								<button class="btn btn-info btn-xs" onclick="editData('${res.id}', '${res.username}', '${res.nama}', '${res.role}')"><i class="fa fa-pencil fa-fw"></i> Edit</button>
								<button class="btn btn-danger btn-xs" onclick="deleteData('${res.id}');"><i class="fa fa-trash fa-fw"></i> Delete</button>
							</div>
						</div>
						`;
						return html;
					}
				},
			],
			"columnDefs": [
			{ 
				"targets": [11],
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
		let c = confirm('Hapus Produk ?');

		if(c == true){
			$.ajax({
				url: `<?=site_url();?>admin/product/destroy`,
				method: 'post',
				data: { id: id },
				dataType: 'json',
				beforeSend: function(){
					$.blockUI();
				}
			})
			.done(function(res){
				if(res.code == 200){
					alert('Hapus Produk Berhasil');
					table.draw();
				}else{
					alert('Hapus Produk Gagal');
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