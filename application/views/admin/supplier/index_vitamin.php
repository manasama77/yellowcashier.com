<link rel="stylesheet" href="<?=base_url();?>vendor/datatables/datatables.min.css">
<script src="<?=base_url();?>vendor/datatables/datatables.min.js"></script>
<script>
	$(document).ready(function(){
		table = $('#datatables').DataTable({
			"destroy": true,
			"responsive": true,
			"processing": true, 
			"serverSide": true,
			"scrollX": true,
			"order": [], 
			"ajax": {
				"url": `<?=site_url('datatables/datatables_supplier')?>`,
				"type": "POST"
			},
			"columns": [
				{ "data": "kode" },
				{ "data": "nama" },
				{ "data": "alamat" },
				{ "data": "nama_provinsi" },
				{ "data": "nama_kota" },
				{ "data": "kodepos" },
				{ "data": "no_telepon" },
				{ "data": "no_fax" },
				{ "data": "email" },
				{ "data": "pic" },
				{ "data": "no_handphone" },
				{ "data": "nama_bank" },
				{ "data": "no_rekening" },
				{ "data": "atas_nama" },
				{ "data": "catatan" },
				{ 
					"data": null,
					"render": function(res){
						html = `
						<div class="text-center">
							<div class="btn-group">
								<button class="btn btn-info btn-xs" onclick="editData('${res.id}', '${res.kode}', '${res.nama}', '${res.alamat}', '${res.id_provinsi}', '${res.id_kota}', '${res.kodepos}', '${res.no_telepon}', '${res.no_fax}', '${res.email}', '${res.pic}', '${res.no_handphone}', '${res.id_bank}', '${res.no_rekening}', '${res.no_rekening}', '${res.atas_nama}', '${res.catatan}')"><i class="fa fa-pencil fa-fw"></i> Edit</button>
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
				"targets": [15],
				"orderable": false,
			},
			],
		});

		$('#form_edit').on('submit', function(e){
			e.preventDefault();

			$.ajax({
				url: `<?=site_url();?>admin/supplier/update`,
				method: 'post',
				dataType: 'json',
				data: $('#form_edit').serialize(),
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

		$('#edit_id_provinsi').on('change', function(){

			if($('#edit_id_provinsi').find(':selected').val().length > 0){

				$.ajax({
					url: `<?=site_url();?>admin/supplier/get_list_kota`,
					method: 'get',
					dataType: 'json',
					data: { id_provinsi: $(this).val() },
					beforeSend: function(){
						$('#edit_id_kota').val(null).html(null).attr('disabled', true);
						$.blockUI();
					}
				}).done(function(res){
					console.log(res);
					if(res.code == 200){
						let html = `<option value=""></option>`;
						$.each(res.data, function(i, k){
							html += `
							<option value="${k.id}">${k.nama}</option>
							`;
							$('#edit_id_kota').html(html).attr('disabled', false);
						});
					}else{
						alert(`<?=GA_KONEK;?>`);
					}
					$.unblockUI();
				});

			}else{
				$('#edit_id_kota').val(null).html(null).attr('disabled', true);
			}

		});

	});

	function editData(id, kode, nama, alamat, id_provinsi, id_kota, kodepos, no_telepon, no_fax, email, pic, no_handphone, id_bank, no_rekening, atas_nama, catatan)
	{
		console.log(id_kota)
		$('#edit_id').val(id);
		$('#edit_kode').val(kode);
		$('#edit_nama').val(nama);
		$('#edit_alamat').val(alamat);
		$('#edit_kodepos').val(kodepos);
		$('#edit_no_telepon').val(no_telepon);
		$('#edit_no_fax').val(no_fax);
		$('#edit_email').val(email);
		$('#edit_pic').val(pic);
		$('#edit_no_handphone').val(no_handphone);
		$('#edit_no_rekening').val(no_rekening);
		$('#edit_atas_nama').val(atas_nama);
		$('#edit_catatan').val(catatan);

		$('#edit_id_provinsi').val(id_provinsi).trigger('change');
			
		setTimeout(function(){
			$('#edit_id_kota').val(id_kota).trigger('change');

			setTimeout(function(){
				$('#edit_id_bank').val(id_bank);
			}, 500);

		}, 500);

		$('#modal-edit').modal('show');
		$('#edit_nama').focus();
	}

	function deleteData(id)
	{
		let c = confirm('Hapus Akun ?');

		if(c == true){
			$.ajax({
				url: `<?=site_url();?>admin/supplier/destroy`,
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