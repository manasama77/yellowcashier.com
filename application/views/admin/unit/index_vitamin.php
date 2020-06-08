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
				"url": `<?=site_url('datatables/datatables_unit')?>`,
				"type": "POST"
			},
			"columns": [
				{ "data": "nama" },
				{ 
					"data": null,
					"render": function(res){
						html = `
						<div class="text-center">
							<div class="btn-group">
								<button class="btn btn-info btn-xs" onclick="editData('${res.id}', '${res.nama}')"><i class="fa fa-pencil fa-fw"></i> Edit</button>
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
				"targets": [1],
				"orderable": false,
			},
			],
		});

		$('#form_add').on('submit', function(e){
			e.preventDefault();

			$.ajax({
				url: `<?=site_url();?>admin/unit/store`,
				method: 'post',
				dataType: 'json',
				data: $(this).serialize(),
				beforeSend: function(){
					$('#add_submit').attr('disabled', true);
					$.blockUI();
				}
			}).done(function(res){
				if(res.code == 200){
					alert('Tambah Satuan Berhasil');
					$('#nama').val(null);
					table.draw();
				}else if(res.code == 400){
					alert('Satuan telah terdaftar, silahkan cek kembali');
				}else{
					alert('Tambah Satuan Gagal');
				}
				$('#add_submit').attr('disabled', false);
				$.unblockUI();
			});
		});

		$('#form_edit').on('submit', function(e){
			e.preventDefault();

			$.ajax({
				url: `<?=site_url();?>admin/unit/update`,
				method: 'post',
				dataType: 'json',
				data: {
					id: $('#edit_id').val(),
					nama: $('#edit_nama').val(),
				},
				beforeSend: function(){
					$('#edit_submit').attr('disabled', true);
					$.blockUI();
				}
			}).done(function(res){
				if(res.code == 200){
					alert('Update Satuan Berhasil');
					$('#edit_id').val(null);
					$('#edit_nama').val(null);
					$('#modal-edit').modal('hide');
					table.draw();
				}else{
					alert('Edit Satuan Gagal');
				}
				$('#edit_submit').attr('disabled', false);
				$.unblockUI();
			});
		});

	});

	function editData(id, nama)
	{
		$('#edit_id').val(id);
		$('#edit_nama').val(nama);
		$('#modal-edit').modal('show');
	}

	function deleteData(id)
	{
		let c = confirm('Hapus Satuan ?');

		if(c == true){
			$.ajax({
				url: `<?=site_url();?>admin/unit/destroy`,
				method: 'post',
				data: { id: id },
				dataType: 'json',
				beforeSend: function(){
					$.blockUI();
				}
			})
			.done(function(res){
				if(res.code == 200){
					alert('Hapus Satuan Berhasil');
					table.draw();
				}else{
					alert('Hapus Satuan Gagal');
				}
				$.unblockUI();

			});
		}
	}
</script>